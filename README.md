<!-- markdownlint-disable MD033 MD041 -->
<div align="center">

<img src="https://raw.githubusercontent.com/markbattistella/ZodiacKit/main/zodiackit-icon.png" width="128" height="128" alt="Swift Package logo"/>

# ZodiacKit

![Languages](https://img.shields.io/badge/Languages-Swift%20|%20SwiftUI%20|%20UIKit%20|%20AppKit-white?labelColor=orange&style=flat)

![Platforms](https://img.shields.io/badge/Platforms-iOS%2013+%20|%20iPadOS%2013+%20|%20macOS%2010.15+%20|%20tvOS%2013+-white?labelColor=gray&style=flat)

![Licence](https://img.shields.io/badge/Licence-MIT-white?labelColor=blue&style=flat)

</div>

**ZodiacKit** is a Swift package that allows you to fetch Western and Chinese Zodiac Sign information based on a given date. It provides a simple, efficient, and easily integrable solution for applications that deal with astrological data.

## Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
  - [Basic Usage](#basic-usage)
  - [Custom date ranges (Western only)](#custom-date-ranges-western-only)
  - [In-app usage](#in-app-usage)
    - [UIKit](#uikit)
    - [SwiftUI](#swiftui)
    - [AppKit](#appkit)
- [Default Date Ranges](#default-date-ranges)
- [Validation](#validation)
  - [Date Range Overlap](#date-range-overlap)
  - [Missing Dates](#missing-dates)
  - [Duplicated Zodiac Signs](#duplicated-zodiac-signs)
  - [Missing Zodiac Signs](#missing-zodiac-signs)
  - [Invalid Dates](#invalid-dates)
- [Error handling](#error-handling)
- [Attributes](#attributes)
  - [`WesternZodiacSign`](#westernzodiacsign)
  - [`ChineseZodiacSign`](#chinesezodiacsign)
    - [Characteristics and Compatibility](#characteristics-and-compatibility)
- [Important Notes](#important-notes)
- [Contributing](#contributing)
- [License](#license)

## Description

ZodiacKit contains a `ZodiacService` struct that helps you retrieve the Western and Chinese zodiac signs. It can then find a zodiac sign based on a `Date`.

This package validates zodiac date ranges and throws relevant errors if inconsistencies are found. Errors include overlapping date ranges, missing dates, duplicated zodiac signs, and missing zodiac signs.

The `WesternZodiacSign` and `ChineseZodiacSign` enums are an easily readable and accessible way to represent relevant zodiac signs in the Swift language.

They include various properties like the sign name, its worldly element, an emoji representation, yin-yang, and more. This can be a valuable resource when developing an application dealing with zodiac signs.

## Installation

The ZodiacKit package uses Swift Package Manager (SPM) for easy addition. Follow these steps to add it to your project:

1. In Xcode, click `File -> Swift Packages -> Add Package Dependency`.
2. In the search bar, type `https://github.com/markbattistella/ZodiacKit` and click `Next`.
3. Specify the version you want to use. You can select the exact version, use the latest one, or set a version range, and then click `Next`.
4. Finally, select the target in which you want to use `ZodiacKit` and click `Finish`.

> [!CAUTION]
> `v1.x` to `v2.x` has some breaking changes - mainly in the naming for `Sign` now being prefixed with `Western` or `Chinese` since the addition of extra Zodiacs.

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

You can then use the properties of the `WesternZodiacSign` and `ChineseZodiacSign` to get information about those zodiac signs.

#### Custom date ranges (Western only)

If you want to use custom zodiac date ranges instead of the defaults (for the `WesternZodiacSign`), you can do so by passing a custom array of `WesternZodiac` structs during `ZodiacService` initialisation:

```swift
let customZodiacs: [WesternZodiac] = [
  Zodiac(
    sign: .aquarius,
    startDate: .init(day: 22, month: 1),
    endDate: .init(day: 19, month: 2)
  ),
  // ...
]

let zodiacService = try? ZodiacService(zodiacs: customZodiacs)
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
    @State private var westernZodiacSign: WesternZodiacSign?
    @State private var chineseZodiacSign: ChineseZodiacSign?

    var body: some View {
        VStack {
            if let westernSign = westernZodiacSign,
               let chineseSign = chineseZodiacSign {
                Text("Your zodiac sign is \(westernSign.name)")
                Text("Your Chinese Zodiac sign is: \(chineseSign.name)")
            } else {
                Text("Failed to get zodiac sign")
            }
        }.onAppear {
            do {
                let zodiacService = try ZodiacService()
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

By default, this package uses the following date ranges for each zodiac sign in the Western format:

| Zodiac Sign  | Start Date Range | End Date Range |
|--------------|------------------|----------------|
| Aquarius     | January 20       | February 18    |
| Pisces       | February 19      | March 20       |
| Aries        | March 21         | April 19       |
| Taurus       | April 20         | May 20         |
| Gemini       | May 21           | June 20        |
| Cancer       | June 21          | July 22        |
| Leo          | July 23          | August 22      |
| Virgo        | August 23        | September 22   |
| Libra        | September 23     | October 22     |
| Scorpio      | October 23       | November 21    |
| Sagittarius  | November 22      | December 21    |
| Capricorn    | December 22      | January 19     |

## Validation

ZodiacKit includes built-in validation to ensure the consistency and correctness of the provided zodiac sign data.

During the initialisation of `ZodiacService`, the package performs several checks:

### Date Range Overlap

The package checks to make sure that the date ranges of all zodiac signs do not overlap. Overlapping date ranges could lead to ambiguous results when determining the zodiac sign for a particular date.

### Missing Dates

All dates in a year must be covered by the defined zodiac signs. If there are any gaps in the date ranges, ZodiacKit will throw an error.

### Duplicated Zodiac Signs

The package ensures that each zodiac sign is unique and defined only once. If the same sign is defined multiple times with different date ranges, an error is thrown.

### Missing Zodiac Signs

All twelve zodiac signs must be represented. If any are missing, an error will be thrown.

### Invalid Dates

The package checks if the start or end date of any zodiac sign is invalid (e.g., February 30). If an invalid date is found, an error is thrown.

These validations help ensure that the zodiac sign data you are working with is accurate and that the service will return correct results. If any of these validations fail, the `ZodiacService` initialisation will throw an error. It's essential to catch and handle these errors in your application to ensure a smooth user experience.

Here's an example of how to handle errors during `ZodiacService` initialisation:

```swift
do {
    let zodiacService = try ZodiacService()
    // Use zodiacService...
} catch {
    print("Failed to initialize ZodiacService: \(error)")
}
```

The thrown error will be of type `ZodiacService.ZodiacError,` which you can use to provide more specific error handling or messaging in your application.

## Error handling

ZodiacKit performs multiple validations to ensure consistency and correctness of the data. Here's a table that includes each `ZodiacError` that the `ZodiacService` might throw:

| Error              | Description |
|--------------------|-------------|
| `dateRangeOverlap` | Thrown when the date ranges of the zodiac signs overlap. |
| `missingDates`     | Thrown when there are missing dates that no zodiac sign covers. |
| `duplicatedSigns`  | Thrown when the same zodiac sign is defined more than once. |
| `missingSigns`     | Thrown when not all zodiac signs are represented. |
| `invalidDates`     | Thrown when a date that doesn't exist in the Gregorian calendar (e.g., February 30) is used. |

Each error is an enum case and carries associated data. For example, the `dateRangeOverlap` error carries two `Zodiac` structs that have overlapping date ranges. You can use this data to provide detailed error messages.

Here's an example of handling a `dateRangeOverlap` error:

```swift
do {
    let zodiacService = try ZodiacService()
    // Use zodiacService...
} catch ZodiacService.ZodiacError.dateRangeOverlap(let firstZodiac, let secondZodiac) {
    print("\(firstZodiac.sign) and \(secondZodiac.sign) have overlapping date ranges.")
} catch {
    print("An unknown error occurred.")
}
```

## Attributes

### `WesternZodiacSign`

| Attribute | Description | Possible Values |
|-|-|-|
| `name` | The capitalised name of the zodiac sign, derived directly from the enum case value. | Aquarius, Aries, Cancer, Capricorn, Gemini, Leo, Libra, Pisces, Sagittarius, Scorpio, Taurus, Virgo |
| `worldlyElement` | Represents one of the four classical elements (Air, Fire, Water, Earth) associated with the zodiac sign, indicating the sign's nature and temperament. | Air (Aquarius, Gemini, Libra), Fire (Aries, Leo, Sagittarius), Water (Cancer, Scorpio, Pisces), Earth (Capricorn, Taurus, Virgo) |
| `worldlyElementEmoji` | An emoji symbolising the worldly element (💨 for Air, 🔥 for Fire, 💧 for Water, 🪨 for Earth) associated with the zodiac sign. | 💨 (Air), 🔥 (Fire), 💧 (Water), 🪨 (Earth) |
| `emoji` | The astrological symbol emoji representing the zodiac sign (e.g., ♈️ for Aries). | ♒️, ♈️, ♋️, ♑️, ♊️, ♌️, ♎️, ♓️, ♐️, ♏️, ♉️, ♍️ |
| `color` | The colour traditionally associated with the zodiac sign, using system colours for compatibility with UI elements (e.g., `.systemBlue` for Aquarius). | `.systemBlue`, `.systemRed`, `.systemPurple`, `.black`, `.systemYellow`, `.systemOrange`, `.systemPink`, `.systemGreen`, `.systemBrown`, `.magenta`, `.gray` |
| `rulingPlanetName` | The name of the planet or celestial body that rules over the zodiac sign, reflecting certain personality traits and aspects (e.g., "Mars" for Aries). | Mars, Venus, Mercury, Moon, Sun, Jupiter, Saturn, Uranus, Neptune, Pluto |
| `rulingPlanet` | The astrological symbol of the ruling planet or celestial body associated with the zodiac sign (e.g., "♂" for Mars, ruling planet of Aries). | ♂ (Mars), ♀ (Venus), ☿ (Mercury), ☽ (Moon), ☉ (Sun), ♃ (Jupiter), ♄ (Saturn), ♅ (Uranus), ♆ (Neptune), ♇ (Pluto) |

### `ChineseZodiacSign`

| Attribute | Description | Possible Values |
|-|-|-|
| `name` | The capitalised name of the zodiac animal sign, derived directly from the enum case value. | Rat, Ox, Tiger, Rabbit, Dragon, Snake, Horse, Goat, Monkey, Rooster, Dog, Pig |
| `fixedElement` | Represents the element (Wood, Fire, Earth, Metal, Water) that is fixed for each zodiac sign, symbolising core aspects of the sign's nature. | Water (Rat, Pig), Earth (Ox, Dragon, Goat, Dog), Wood (Tiger, Rabbit), Fire (Snake, Horse), Metal (Monkey, Rooster) |
| `fixedElementEmoji` | An emoji symbolising the fixed element (💧 for Water, 🪨 for Earth, 🪵 for Wood, 🔥 for Fire, 🔗 for Metal) associated with the zodiac sign. | 💧 (Water), 🪨 (Earth), 🪵 (Wood), 🔥 (Fire), 🔗 (Metal) |
| `emoji` | The emoji representation of the Chinese zodiac animal (e.g., 🐂 for Ox). | 🐀, 🐂, 🐅, 🐇, 🐉, 🐍, 🐎, 🐐, 🐒, 🐓, 🐕, 🐖 |
| `yinYang` | Indicates the Yin or Yang nature of the sign, reflecting the sign's inherent energy and philosophy in Chinese astrology. | Yin (Rat, Ox, Tiger, Rabbit, Snake, Monkey, Rooster, Pig), Yang (Dragon, Horse, Goat, Dog) |

#### Characteristics and Compatibility

A list of descriptive characteristics attributed to the zodiac sign and other zodiac signs that are most compatible with the sign in question.

| Zodiac | Characteristics | Compatibility |
|-|-|-|
| `Rat` | Intelligence, Adaptability, Quick-wit, Charm, Artistry, Gregariousness. | `Dragon`, `Monkey` |
| `Ox` | Loyalty, Reliability, Thoroughness, Strength, Reasonability, Steadiness, Determination. | `Rat`, `Rooster`, `Snake` |
| `Tiger` | Enthusiasm, Courage, Ambition, Leadership, Confidence, Charisma. | `Horse`, `Dog` |
| `Rabbit` | Trustworthiness, Empathy, Modesty, Diplomacy, Sincerity, Sociability. | `Goat`, `Pig`, `Dog` |
| `Dragon` | Luckiness, Flexibility, Eccentricity, Imagination, Artistry, Spirituality. | `Rooster`, `Rat`, `Monkey` |
| `Snake` | Philosophical, Organised, Intelligent, Intuitive, Elegant, Attentive, Decisive. | `Ox`, `Rooster` |
| `Horse` | Adaptability, Loyalty, Courage, Ambition, Intelligence, Adventure, Strong freedom. | `Tiger`, `Dog`, `Goat` |
| `Goat` | Imagination, Creativity, Empathy, Generosity, Honesty, Persistence, Gentleness. | `Rabbit`, `Horse`, `Pig` |
| `Monkey` | Intelligence, Adaptability, Quick-wit, Charm, Luck, Flexibility. | `Rat`, `Dragon` |
| `Rooster` | Honesty, Energy, Intelligence, Flamboyance, Flexibility, Diversity, Confidence. | `Ox`, `Dragon`, `Snake` |
| `Dog` | Loyalty, Sincerity, Reliability, Intelligence, Sociability, Understanding, Patience. | `Tiger`, `Rabbit`, `Horse` |
| `Pig` | Honesty, Sincerity, Tolerance, Hardworking, Generosity, Optimism, Peace. | `Goat`, `Rabbit` |

## Important Notes

- This package is locale-independent and assumes a Gregorian calendar.
- Error handling is crucial when dealing with `ZodiacService`. Make sure to catch and properly handle any exceptions that may be thrown.

## Contributing

Contributions are more than welcome. If you find a bug or have an idea for an enhancement, please open an issue or provide a pull request. Please follow the code style present in the current code base when making contributions.

## License

The Zodiac Signs package is released under the MIT license. See [LICENSE](https://github.com/markbattistella/ZodiacKit/blob/main/LICENSE) for more information.
