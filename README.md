<!-- markdownlint-disable MD033 MD041 -->
<div align="center">

<img src="https://raw.githubusercontent.com/markbattistella/ZodiacKit/main/zodiackit-icon.png" width="128" height="128" alt="Swift Package logo"/>

# ZodiacKit

![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FZodiacKit%2Fbadge%3Ftype%3Dswift-versions)

![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FZodiacKit%2Fbadge%3Ftype%3Dplatforms)

![Licence](https://img.shields.io/badge/Licence-MIT-white?labelColor=blue&style=flat)

</div>

`ZodiacKit` is a Swift package that determines **Western** and **Chinese** zodiac signs from a given date. It supports multiple astrological systems, provides extensive zodiac metadata, and includes strong validation with clear error handling.

## Description

`ZodiacKit` makes it easy to:

- Fetch a user's **Western zodiac sign** based on one of four systems (Tropical, Sidereal, Equal-Length, or Astronomical).
- Determine their **Chinese zodiac sign** based on the lunar new year.
- Access traits, elements, ruling planets, emojis, and compatibility details.
- Validate zodiac date ranges with automatic error detection.

`ZodiacKit` includes a `ZodiacService` class and robust enums for both `Western` and `Chinese` signs.

## Installation

Add `ZodiacKit` to your Swift project using Swift Package Manager.

```swift
dependencies: [
  .package(url: "https://github.com/markbattistella/ZodiacKit", from: "x.y.z")
]
```

> [!CAUTION]
> `v1.x` to `v2.x` has some breaking changes.
> `v2.x` to `v3.x` has some breaking changes.

## Usage

Remember to import the `ZodiacKit` module:

```swift
import ZodiacKit
```

### Basic Usage

The default usage of the ZodiacKit package is quite straightforward. Here's an example:

```swift
let zodiacService = try ZodiacService()
let dateComponents = DateComponents(year: 1991, month: 5, day: 29)
let birthDate = Calendar.current.date(from: dateComponents)

let westernZodiacSign = try? zodiacService.getWesternZodiac(from: birthDate!)
let chineseZodiacSign = try? zodiacService.getChineseZodiac(from: birthDate!)

// westernZodiacSign.name: Gemini 
// chineseZodiacSign.name: Goat
```

This will give you the corresponding information and attributes based on the date provided.

You can then use the properties of the `Western` and `Chinese` to get information about those zodiac signs.

#### Custom date ranges (Western only)

If you want to use custom zodiac date ranges instead of the defaults (for the `Western`), you can do so by passing a custom array of `Zodiac` structs during `ZodiacService` initialisation:

```swift
let customZodiacs: [Zodiac] = [
  Zodiac(
    sign: .aquarius,
    startDate: .init(day: 22, month: 1),
    endDate: .init(day: 19, month: 2)
  ),
  // ...
]

let zodiacService = try? ZodiacService(system: .custom(customZodiacs))
```

### In-app usage

#### UIKit

Here's an example of how to use ZodiacKit in a UIKit `UIViewController`.

```swift
import UIKit
import ZodiacKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let zodiacService = try ZodiacService()
            let dateComponents = DateComponents(year: 1991, month: 5, day: 29)
            let birthDate = Calendar.current.date(from: dateComponents)

            let westernZodiacSign = try zodiacService.getWesternZodiac(from: birthDate!)
            let chineseZodiacSign = try zodiacService.getChineseZodiac(from: birthDate!)

            // Use signs...
            print(westernZodiacSign.name) // Gemini
            print(chineseZodiacSign.name) // Goat
        } catch {
            print("Failed to get zodiac sign: \(error)")
        }
    }
}
```

#### SwiftUI

Below is an example of using ZodiacKit in a SwiftUI view.

```swift
import SwiftUI
import ZodiacKit

struct ContentView: View {
  @StateObject private var zodiacService = ZodiacService()

  @State private var westernZodiacSign: WesternZodiacSign?
  @State private var chineseZodiacSign: ChineseZodiacSign?

  var body: some View {
    VStack {
      if let westernSign = westernZodiacSign, let chineseSign = chineseZodiacSign {
        Text("Your zodiac sign is \(westernSign.name)")
        Text("Your Chinese Zodiac sign is: \(chineseSign.name)")
      } else {
        Text("Failed to get zodiac sign")
      }
    }
    .task {
      do {
        let dateComponents = DateComponents(year: 1991, month: 5, day: 29)
        let birthDate = Calendar.current.date(from: dateComponents)
        westernZodiacSign = try zodiacService.getWesternZodiac(from: birthDate!)
        chineseZodiacSign = try zodiacService.getChineseZodiac(from: birthDate!)
      } catch {
        print("Failed to get zodiac sign: \(error)")
      }
    }
  }
}
```

#### AppKit

Here's how to use ZodiacKit in an AppKit `NSViewController`.

```swift
import AppKit
import ZodiacKit

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let zodiacService = try ZodiacService()
            let dateComponents = DateComponents(year: 1991, month: 5, day: 29)
            let birthDate = Calendar.current.date(from: dateComponents)

            let westernZodiacSign = try zodiacService.getWesternZodiac(from: birthDate!)
            let chineseZodiacSign = try zodiacService.getChineseZodiac(from: birthDate!)

            // Use signs...
            print(westernZodiacSign.name) // Gemini
            print(chineseZodiacSign.name) // Goat
        } catch {
            print("Failed to get zodiac sign: \(error)")
        }
    }
}
```

## Default Date Ranges

### Tropical System

This is the one most commonly used in Western astrology.

| Zodiac Sign  | Start Date   | End Date     |
|--------------|--------------|--------------|
| Aries        | 21 March     | 19 April     |
| Taurus       | 20 April     | 20 May       |
| Gemini       | 21 May       | 20 June      |
| Cancer       | 21 June      | 22 July      |
| Leo          | 23 July      | 22 August    |
| Virgo        | 23 August    | 22 September |
| Libra        | 23 September | 22 October   |
| Scorpio      | 23 October   | 21 November  |
| Sagittarius  | 22 November  | 21 December  |
| Capricorn    | 22 December  | 19 January   |
| Aquarius     | 20 January   | 18 February  |
| Pisces       | 19 February  | 20 March     |

### Sidereal System (Vedic)

Based on the actual position of constellations in the sky, accounting for precession.

| Zodiac Sign  | Start Date   | End Date     |
|--------------|--------------|--------------|
| Aries        | 14 April     | 14 May       |
| Taurus       | 15 May       | 15 June      |
| Gemini       | 16 June      | 16 July      |
| Cancer       | 17 July      | 16 August    |
| Leo          | 17 August    | 16 September |
| Virgo        | 17 September | 16 October   |
| Libra        | 17 October   | 15 November  |
| Scorpio      | 16 November  | 15 December  |
| Sagittarius  | 16 December  | 14 January   |
| Capricorn    | 15 January   | 12 February  |
| Aquarius     | 13 February  | 14 March     |
| Pisces       | 15 March     | 13 April     |

### Equal-Length System

Each sign gets approximately 30.4 days, ignoring constellation size. Based on reconstructed Hellenistic tradition.

| Zodiac Sign  | Start Date   | End Date     |
|--------------|--------------|--------------|
| Aries        | 16 April     | 11 May       |
| Cetus        | 12 May       | 6 June       |
| Taurus       | 7 June       | 2 July       |
| Gemini       | 3 July       | 28 July      |
| Cancer       | 29 July      | 23 August    |
| Leo          | 24 August    | 18 September |
| Virgo        | 19 September | 14 October   |
| Libra        | 15 October   | 9 November   |
| Scorpio      | 10 November  | 5 December   |
| Ophiuchus    | 6 December   | 31 December  |
| Sagittarius  | 1 January    | 26 January   |
| Capricorn    | 27 January   | 21 February  |
| Aquarius     | 22 February  | 20 March     |
| Pisces       | 21 March     | 15 April     |

### Astronomical (IAU) System

This system follows the actual star boundaries defined by the International Astronomical Union. Sign durations vary significantly.

| Zodiac Sign  | Start Date   | End Date     |
|--------------|--------------|--------------|
| Aries        | 19 April     | 13 May       |
| Taurus       | 14 May       | 21 June      |
| Gemini       | 22 June      | 20 July      |
| Cancer       | 21 July      | 10 August    |
| Leo          | 11 August    | 16 September |
| Virgo        | 17 September | 30 October   |
| Libra        | 31 October   | 23 November  |
| Scorpio      | 24 November  | 29 November  |
| Ophiuchus    | 30 November  | 17 December  |
| Sagittarius  | 18 December  | 20 January   |
| Capricorn    | 21 January   | 16 February  |
| Aquarius     | 17 February  | 11 March     |
| Pisces       | 12 March     | 18 April     |

## Validation

`ZodiacKit` includes built-in validation to ensure the consistency and correctness of the provided zodiac sign data.

During the initialisation of `ZodiacService`, the package performs several checks:

1. Ensures no duplicate signs exist.
2. Ensures all expected signs are included (internal use only).
3. Ensures every day of the year is covered by one and only one zodiac.
4. Ensures there are no overlapping date ranges.
5. Ensures the date ranges are continuous from day 1 through 366.

## Error Handling

`ZodiacKit` performs several validations to ensure data consistency and accuracy. If an issue is found during initialisation or zodiac lookup, it throws a `ZodiacError`.

Below are the possible errors:

| Error Case | Description |
|-|-|
| `invalidDateComponents(date:)` | The provided `Date` has missing or invalid components such as a nil day or month. |
| `couldNotConstructLeapDate(month:day:)` | A valid leap-year date could not be formed from the given month and day, likely due to an invalid combination (e.g. February 30). |
| `couldNotGetDayOfYear(adjustedDate:)` | The system failed to calculate the day of the year from the adjusted date, often due to invalid or out-of-range values. |
| `duplicateZodiacsFound(duplicates:)` | There are multiple definitions for the same zodiac sign, indicating a configuration conflict. |
| `missingZodiacs(missing:)` | Some expected zodiac signs were not defined, making the system incomplete. |
| `missingDays(missingDays:)` | One or more calendar days aren’t assigned to any zodiac sign, causing coverage gaps. |
| `overlappingDays(days:)` | Some days are assigned to more than one zodiac sign, violating the one-sign-per-day rule. |
| `nonContinuousRanges` | Zodiac ranges don't form a complete, gap-free sequence from day 1 through 366. |
| `invalidData` | Zodiac data is corrupted or couldn't be parsed correctly. |
| `dayNumberNotFound(dayNumber:)` | No zodiac sign could be determined for a specific day of the year, typically due to misconfiguration. |

### Example

```swift
/// A demo view that shows zodiac sign results from multiple Western systems and the Chinese zodiac. Users can select a date, and the relevant signs are calculated and displayed.
struct ZodiacDemo: View {
  @StateObject private var serviceTropical = ZodiacService(system: .tropical)
  @StateObject private var serviceSidereal = ZodiacService(system: .sidereal)
  @StateObject private var serviceEqual = ZodiacService(system: .equalLength)
  @StateObject private var serviceIAU = ZodiacService(system: .astronomicalIAU)

  @State private var western: (
    tropical: Western,
    sidereal: Western,
    equal: Western,
    iau: Western
  )? = nil

  @State private var chinese: Chinese? = nil
  @State private var selectedDate: Date = .now

  var body: some View {
    Form {
      if let western {
        Section("Western Zodiac") {
          LabeledContent("Tropical", value: western.tropical.name)
          LabeledContent("Sidereal", value: western.sidereal.name)
          LabeledContent("Equal Length", value: western.equal.name)
          LabeledContent("Astronomical IAU", value: western.iau.name)
        }
      }

      if let chinese {
        Section("Chinese Zodiac") {
          LabeledContent("Chinese", value: chinese.name)
        }
      }

      DatePicker(
        "Select a date",
        selection: $selectedDate,
        displayedComponents: [.date]
      )
      .datePickerStyle(.graphical)
    }
    .task { loadZodiac(for: selectedDate) }
    .onChange(of: selectedDate) { _, newDate in
      loadZodiac(for: newDate)
    }
    .scrollBounceBehavior(.basedOnSize)
  }

  /// Loads zodiac signs for all supported systems based on the given date.
  /// Western signs are loaded from four different systems, and Chinese zodiac is shared across.
  private func loadZodiac(for date: Date) {
    Task {
      do {
        let tropical = try serviceTropical.getWesternZodiac(from: date)
        let sidereal = try serviceSidereal.getWesternZodiac(from: date)
        let equal = try serviceEqual.getWesternZodiac(from: date)
        let iau = try serviceIAU.getWesternZodiac(from: date)

        self.western = (tropical, sidereal, equal, iau)
        self.chinese = try serviceTropical.getChineseZodiac(from: date)
      } catch {
        print("Failed to get zodiac signs: \(error.localizedDescription)")
        self.western = nil
        self.chinese = nil
      }
    }
  }
}
```

## Attributes

### `WesternZodiacSign`

| Attribute | Description | Example / Values |
|-----------|-------------|------------------|
| `name` | The capitalised name of the sign. | `"Leo"` |
| `emoji` | An emoji representing the astrological glyph. | ♈️, ♉️, ♊️ |
| `element` | The associated classical element. | `"Fire"`, `"Earth"` |
| `elementEmoji` | Emoji for the element. | 🔥, 🌍 |
| `characteristics` | Primary personality descriptors. | `["Bold", "Loyal", "Dramatic"]` |
| `colorHEX` | Associated HEX colour value. | `#FFD700`, `#FF4500` |
| `color` | Platform-agnostic colour (derived from `colorHEX`). | `.init(hex: "#FFD700")` |
| `rulingPlanetName` | Modern ruling planet. | `"Sun"`, `"Mars"` |
| `traditionalRulingPlanetName` | Traditional ruling planet (if different). | `"Earth"` |
| `rulingPlanetSymbol` | Planetary symbol. | `☉`, `♂` |
| `modality` | Cardinal, Fixed, or Mutable. | `"Fixed"` |
| `polarity` | Astrological polarity. | `"Positive"` |
| `rulingHouse` | Governing astrological house. | `"5th House"` |
| `brightestStar` | Brightest star in constellation. | `"Regulus"` |
| `yinYang` | Yin or Yang classification. | `"Yang"` |
| `season` | Season associated with the sign. | `"Summer"` |
| `symbol` | Symbolic name of the sign. | `"Lion"` |
| `symbolEmoji` | Emoji representation of symbol. | 🦁 |
| `birthstone` | Traditional birthstone. | `"Peridot"` |
| `strengths` | Strong qualities. | `["Creative", "Warm-hearted"]` |
| `weaknesses` | Common flaws. | `["Arrogant", "Stubborn"]` |
| `keyTraits` | Distilled trait summary. | `["Leader", "Passionate"]` |
| `bestMatches` | Highly compatible signs. | `[.aries, .sagittarius]` |
| `averageMatches` | Neutral compatibility signs. | `[.gemini, .libra]` |
| `conflictingMatches` | Possible tension with these signs. | `[.taurus, .scorpio]` |
| `harmfulMatches` | Signs with strong incompatibility. | `[.capricorn, .virgo]` |

### `ChineseZodiacSign`

| Attribute | Description | Example / Values |
|-----------|-------------|------------------|
| `name` | The capitalised name of the zodiac animal. | `"Tiger"` |
| `emoji` | Emoji representing the animal. | 🐅 |
| `element` | Classical element associated with the sign. | `"Wood"` |
| `elementEmoji` | Emoji for the element. | 🪵 |
| `characteristics` | Descriptive traits. | `["Courageous", "Ambitious"]` |
| `colorHEX` | HEX value for sign colour. | `#FFA500` |
| `color` | Platform-agnostic colour object. | `.init(hex: "#FFA500")` |
| `rulingPlanetName` | Associated planet. | `"Jupiter"` |
| `traditionalRulingPlanetName` | Optional traditional ruler. | `"Saturn"` |
| `rulingPlanetSymbol` | Planetary symbol. | ♃ |
| `modality` | Yin or Yang descriptor. | `"Yang"` |
| `polarity` | Energetic polarity (Positive/Negative). | `"Positive"` |
| `rulingHouse` | Seasonal/directional alignment. | `"East"` |
| `brightestStar` | Notable star in the sign's constellation. | `"Aldebaran"` |
| `yinYang` | Yin or Yang classification. | `"Yang"` |
| `season` | Season most aligned with the sign. | `"Spring"` |
| `symbol` | Animal or mythical creature. | `"Tiger"` |
| `symbolEmoji` | Emoji for symbol. | 🐅 |
| `birthstone` | Birthstone of the sign. | `"Jade"` |
| `strengths` | Positive traits. | `["Brave", "Energetic"]` |
| `weaknesses` | Typical challenges. | `["Reckless", "Impatient"]` |
| `keyTraits` | Key summarised traits. | `["Fierce", "Leader", "Adventurous"]` |
| `bestMatches` | Highly compatible signs. | `[.horse, .dragon]` |
| `averageMatches` | Moderately compatible. | `[.rat, .rooster]` |
| `conflictingMatches` | Signs with potential conflict. | `[.monkey, .snake]` |
| `harmfulMatches` | Traditionally avoided matches. | `[.goat, .ox]` |

## Contributing

Contributions are more than welcome. If you find a bug or have an idea for an enhancement, please open an issue or provide a pull request. Please follow the code style present in the current code base when making contributions.

## Licence

The Zodiac Signs package is released under the MIT license. See LICENCE for more information.
