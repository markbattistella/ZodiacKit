//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A service for determining a person's Western and Chinese zodiac signs based on their birthdate.
@ZodiacActor
public struct ZodiacService {

    /// A collection of WesternZodiac objects representing the zodiac signs.
    private let zodiacs: [WesternZodiac]

    /// A validator used to validate zodiacs and dates.
    private let validator = DateValidator()

    /// A mapping from day of the year to WesternZodiacSign.
    private let dayOfYearToZodiac: [Int: WesternZodiacSign]

    /// The Gregorian calendar used for date calculations.
    private static let gregorianCalendar = Calendar(identifier: .gregorian)

    /// Initializes a new ZodiacService with an optional array of WesternZodiac objects.
    ///
    /// - Parameter zodiacs: An array of WesternZodiac objects. If not provided, 
    /// a default set is used.
    /// - Throws: An error if the provided zodiacs are invalid.
        public init(zodiacs: [WesternZodiac] = defaultZodiacs) throws {
            try validator.validate(zodiacs: zodiacs)
            self.zodiacs = zodiacs
            self.dayOfYearToZodiac = ZodiacService.mapZodiacsToDaysOfYear(zodiacs: zodiacs,
                                                                          validator: validator)
        }

    /// Maps zodiac periods to days of the year.
    ///
    /// - Parameters:
    ///   - zodiacs: An array of WesternZodiac objects to map.
    ///   - validator: A DateValidator to validate date components.
    /// - Returns: A dictionary mapping days of the year to WesternZodiacSigns.
    private static func mapZodiacsToDaysOfYear(
        zodiacs: [WesternZodiac],
        validator: DateValidator
    ) -> [Int: WesternZodiacSign] {
        var map: [Int: WesternZodiacSign] = [:]
        for zodiac in zodiacs {
            guard let startDayOfYear = try? validator.dayOfYear(
                    day: zodiac.startDate.day,
                    month: zodiac.startDate.month),
                  let endDayOfYear = try? validator.dayOfYear(
                    day: zodiac.endDate.day,
                    month: zodiac.endDate.month) else {
                continue
            }
            if startDayOfYear <= endDayOfYear {
                for day in startDayOfYear...endDayOfYear { map[day] = zodiac.sign }
            } else {
                for day in startDayOfYear...365 { map[day] = zodiac.sign }
                for day in 1...endDayOfYear { map[day] = zodiac.sign }
            }
        }
        return map
    }

    /// Retrieves the Western zodiac sign for a given date.
    ///
    /// - Parameter date: The date for which to find the zodiac sign.
    /// - Returns: The WesternZodiacSign corresponding to the given date.
    /// - Throws: ZodiacError.dateCalculationError if the zodiac sign cannot be determined.
    public func getWesternZodiac(from date: Date) throws -> WesternZodiacSign {
        guard let dayOfYear = ZodiacService.gregorianCalendar.ordinality(of: .day, in: .year, for: date),
              let zodiacSign = dayOfYearToZodiac[dayOfYear] else {
            throw ZodiacError.dateCalculationError
        }
        return zodiacSign
    }

    /// Deprecated: Use getWesternZodiac(from:) instead.
    @available(*, deprecated, renamed: "getWesternZodiac(from:)", 
                message: "Use getWesternZodiac(from:) instead.")
    public func getZodiac(from date: Date) throws -> WesternZodiacSign {
        try getWesternZodiac(from: date)
    }
}

extension ZodiacService {

    /// Determines the Chinese Zodiac sign based on a given date.
    ///
    /// - Parameter date: The date for which to find the Chinese Zodiac sign.
    /// - Returns: The ChineseZodiacSign corresponding to the given date.
    /// - Throws: ZodiacError if the zodiac sign cannot be determined or if data is invalid.
    public func getChineseZodiac(from date: Date) throws -> ChineseZodiacSign {
        guard let branch = getChineseZodiacBranch(from: date),
              let zodiac = branchNameToZodiac(branch) else {
            throw ZodiacError.invalidData
        }
        return zodiac
    }

    /// Determines the Earthly Branch associated with the Chinese Zodiac year for a given date.
    ///
    /// This method calculates the cyclical year in the Chinese calendar and maps it to
    /// one of the twelve Earthly Branches used in the Chinese Zodiac system. The branch
    /// is returned as a lowercase Pinyin string (e.g., "zi" for Rat, "chou" for Ox).
    ///
    /// - Parameter date: The Gregorian date for which to determine the Chinese Zodiac branch.
    /// - Returns: A Pinyin string representing the Earthly Branch (e.g., "zi", "chou", "yin"), 
    // or `nil` if the year could not be determined.
    private func getChineseZodiacBranch(from date: Date) -> String? {
        let chineseCalendar = Calendar(identifier: .chinese)
        let components = chineseCalendar.dateComponents([.year], from: date)

        guard let cyclicalYear = components.year else {
            return nil
        }

        let branchIndex = (cyclicalYear - 1) % 12
        let branches = ["zi", "chou", "yin", "mao", "chen", "si", "wu", "wei", "shen", "you", "xu", "hai"]
        return branches[branchIndex]
    }

    /// Maps a Chinese Zodiac branch name to its corresponding zodiac sign.
    ///
    /// - Parameter branch: The branch name to map.
    /// - Returns: An optional ChineseZodiacSign corresponding to the branch name.
    private func branchNameToZodiac(_ branch: String) -> ChineseZodiacSign? {
        let dict: [String: ChineseZodiacSign] = [
            "zi": .rat, "chou": .ox, "yin": .tiger, "mao": .rabbit,
            "chen": .dragon, "si": .snake, "wu": .horse, "wei": .goat,
            "shen": .monkey, "you": .rooster, "xu": .dog, "hai": .pig
        ]
        return dict[branch]
    }
}
