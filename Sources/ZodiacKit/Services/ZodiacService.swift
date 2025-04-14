//
// Project: ZodiacKit
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A service responsible for resolving zodiac signs from dates and validating zodiac configurations.
///
/// This class supports both Western and Chinese zodiac systems, providing accurate mapping based
/// on the selected configuration. It is designed to be `@MainActor` safe and integrates smoothly
/// with SwiftUI via `ObservableObject`.
@MainActor
public final class ZodiacService: ObservableObject {

    /// The validated list of Western zodiac sign definitions based on the selected system.
    @Published public private(set) var zodiacs: [Zodiac] = []

    /// The most recent validation error, if any.
    @Published public private(set) var validationError: ZodiacError? = nil

    /// The configured zodiac system (e.g., tropical, sidereal, custom).
    private let system: WesternZodiacSystem

    /// A mapping from day-of-year to corresponding Western zodiac sign.
    private let dayOfYearToZodiac: [Int: Western]

    /// Indicates whether the zodiac configuration is valid.
    public var isValid: Bool { validationError == nil }

    /// Returns all Chinese zodiac signs in cycle order.
    public var allChineseZodiacs: [Chinese] {
        Chinese.allCases
    }

    /// Returns all Western zodiac signs in the current system’s order.
    public var allWesternZodiacs: [Western] {
        zodiacs.map(\.sign)
    }

    /// Creates a new instance of `ZodiacService` with the specified zodiac system.
    ///
    /// If the configuration fails validation, the service will provide an empty zodiac list
    /// and set the `validationError` accordingly.
    ///
    /// - Parameter system: The zodiac system to use. Defaults to `.tropical`.
    public init(system: WesternZodiacSystem = .tropical) {
        self.system = system

        do {
            let loadedZodiacs = try ZodiacLoader.loadZodiacs(from: system)
            self.zodiacs = loadedZodiacs
            self.dayOfYearToZodiac = try ZodiacLoader.mapZodiacsToDaysOfYear(from: loadedZodiacs)
        } catch let error as ZodiacError {
            self.validationError = error
            self.zodiacs = []
            self.dayOfYearToZodiac = [:]
        } catch {
            self.validationError = .invalidData
            self.zodiacs = []
            self.dayOfYearToZodiac = [:]
        }
    }
}

// MARK: - Public Methods

extension ZodiacService {

    /// Resolves the Western zodiac sign for a given date.
    ///
    /// - Parameter date: The date to evaluate.
    /// - Returns: A `Western` zodiac sign.
    /// - Throws: `ZodiacError.dayNumberNotFound` if the day could not be mapped.
    public func getWesternZodiac(from date: Date) throws -> Western {
        let dayOfYear = try date.dayOfYear()
        guard let sign = dayOfYearToZodiac[dayOfYear] else {
            throw ZodiacError.dayNumberNotFound(dayNumber: dayOfYear)
        }
        return sign
    }

    /// Resolves the Chinese zodiac sign for a given Gregorian date.
    ///
    /// - Parameter date: The date to evaluate.
    /// - Returns: A `Chinese` zodiac sign corresponding to the year of the date.
    /// - Throws: `ZodiacError.invalidData` if the lunar year cannot be resolved.
    public func getChineseZodiac(from date: Date) throws -> Chinese {
        let chineseCalendar = Calendar(identifier: .chinese)
        let chineseYearComponent = chineseCalendar.component(.year, from: date)
        let index = (chineseYearComponent - 1) % Int.chineseZodiacCycle
        return Chinese.allCases[index]
    }
}

// MARK: - Get Metadata

extension ZodiacService {

    /// Returns detailed metadata for a given Western zodiac sign.
    ///
    /// - Parameter sign: The sign to retrieve metadata for.
    /// - Returns: A fully populated `ZodiacOverview` object.
    public func metadata(for sign: Western) -> ZodiacOverview {
        .init(
            name: sign.name,
            emoji: sign.emoji,
            element: sign.element,
            elementEmoji: sign.elementEmoji,
            modality: sign.modality,
            polarity: sign.polarity,
            yinYang: sign.yinYang,
            rulingPlanetName: sign.rulingPlanetName,
            traditionalRulingPlanetName: sign.traditionalRulingPlanetName,
            rulingPlanetSymbol: sign.rulingPlanetSymbol,
            rulingHouse: sign.rulingHouse,
            colorHEX: sign.colorHEX,
            symbol: sign.symbol,
            symbolEmoji: sign.symbolEmoji,
            birthstone: sign.birthstone,
            season: sign.season,
            brightestStar: sign.brightestStar,
            characteristics: sign.characteristics,
            strengths: sign.strengths,
            weaknesses: sign.weaknesses,
            keyTraits: sign.keyTraits
        )
    }

    /// Returns detailed metadata for a given Chinese zodiac sign.
    ///
    /// - Parameter sign: The Chinese sign to retrieve metadata for.
    /// - Returns: A fully populated `ZodiacOverview` object.
    public func metadata(for sign: Chinese) -> ZodiacOverview {
        .init(
            name: sign.name,
            emoji: sign.emoji,
            element: sign.element,
            elementEmoji: sign.elementEmoji,
            modality: sign.modality,
            polarity: sign.polarity,
            yinYang: sign.yinYang,
            rulingPlanetName: sign.rulingPlanetName,
            traditionalRulingPlanetName: sign.traditionalRulingPlanetName,
            rulingPlanetSymbol: sign.rulingPlanetSymbol,
            rulingHouse: sign.rulingHouse,
            colorHEX: sign.colorHEX,
            symbol: sign.symbol,
            symbolEmoji: sign.symbolEmoji,
            birthstone: sign.birthstone,
            season: sign.season,
            brightestStar: sign.brightestStar,
            characteristics: sign.characteristics,
            strengths: sign.strengths,
            weaknesses: sign.weaknesses,
            keyTraits: sign.keyTraits
        )
    }
}

// MARK: - Dates

extension ZodiacService {

    /// Returns the date range associated with a given Western zodiac sign.
    ///
    /// - Parameter sign: The zodiac sign to evaluate.
    /// - Returns: A tuple containing the start and end `Date` values, or `nil` if unavailable.
    public func range(for sign: Western) -> (start: Date, end: Date)? {
        guard let zodiac = zodiacs.first(where: { $0.sign == sign }),
              let startDate = try? zodiac.start.toDate(),
              let endDate = try? zodiac.end.toDate() else {
            return nil
        }
        return (startDate, endDate)
    }

    /// Determines whether a given date falls within a specified zodiac sign’s range.
    ///
    /// - Parameters:
    ///   - date: The date to check.
    ///   - sign: The zodiac sign to test against.
    /// - Returns: `true` if the date falls within the sign’s range, otherwise `false`.
    /// - Throws: `ZodiacError.dayNumberNotFound` if the day cannot be resolved.
    public func isInRange(_ date: Date, in sign: Western) throws -> Bool {
        let dayOfYear = try date.dayOfYear()
        guard let expectedSign = dayOfYearToZodiac[dayOfYear] else {
            return false
        }
        return expectedSign == sign
    }
}
