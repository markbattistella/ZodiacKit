# ZodiacKit

ZodiacKit is a Swift package that allows you to fetch Zodiac Sign information based on a given date. It provides a simple, efficient, and easily integrable solution for applications that deal with astrological data.

## Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
  - [Basic Usage](#basic-usage)
  - [In-app Usage](#in-app-usage)
- [Default Date Ranges](#default-date-ranges)
- [Validation](#validation)
- [Error Handling](#error-handling)
- [Important Notes](#important-notes)
- [Contributing](#contributing)
- [License](#license)

## Description

ZodiacKit contains a `ZodiacService` struct that uses a collection of Zodiac signs and their respective date ranges. It can then find a zodiac sign based on a `Date`. This package validates zodiac date ranges and throws relevant errors if inconsistencies are found. Errors include overlapping date ranges, missing dates, duplicated zodiac signs, and missing zodiac signs.

The `Sign` enum is an easily readable and accessible way to represent zodiac signs in the Swift language. It includes various properties like the sign name, its worldly element, an emoji representation, and more. This can be a valuable resource when developing an application dealing with zodiac signs.

## Installation

The ZodiacKit package uses Swift Package Manager (SPM) for easy and convenient distribution. Follow these steps to add it to your project:

1. In Xcode, click `File -> Swift Packages -> Add Package Dependency`.
2. In the search bar, type `https://github.com/markbattistella/ZodiacKit` and click `Next`.
3. Specify the version you want to use. You can select the exact version, use the latest one, or set a version range, and then click `Next`.
4. Finally, select the target in which you want to use `ZodiacKit` and click `Finish`.

## Usage

Remember to import the `ZodiacKit` module:

```swift
import ZodiacKit
```

### Basic Usage

#### Default date ranges

The default usage of the ZodiacKit package is quite straightforward. Here's an example:

```swift
let zodiacService = try? ZodiacService()
let myBirthdate = DateComponents(year: 1990, month: 5, day: 25)
let myZodiacSign = try? zodiacService.getZodiac(from: myBirthdate.date!)
```

This will give you the `Sign` corresponding to the date provided. You can then use the properties of the `Sign` to get information about the zodiac sign.

#### Custom date ranges

If you want to use custom zodiac date ranges instead of the defaults, you can do so by passing a custom array of `Zodiac` structs during `ZodiacService` initialisation:

```swift
let customZodiacs: [Zodiac] = [
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
            let myBirthdate = DateComponents(calendar: .current, year: 1990, month: 5, day: 25).date!
            let myZodiacSign = try zodiacService.getZodiac(from: myBirthdate)
            
            // Use myZodiacSign...
            print(myZodiacSign.name)
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
    @State private var myZodiacSign: Sign?

    var body: some View {
        VStack {
            if let sign = myZodiacSign {
                Text("Your zodiac sign is \(sign.name)")
            } else {
                Text("Failed to get zodiac sign")
            }
        }.onAppear {
            do {
                let zodiacService = try ZodiacService()
                let myBirthdate = DateComponents(calendar: .current, year: 1990, month: 5, day: 25).date!
                myZodiacSign = try zodiacService.getZodiac(from: myBirthdate)
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
            let myBirthdate = DateComponents(calendar: .current, year: 1990, month: 5, day: 25).date!
            let myZodiacSign = try zodiacService.getZodiac(from: myBirthdate)
            
            // Use myZodiacSign...
            print(myZodiacSign.name)
        } catch {
            print("Failed to get zodiac sign: \(error)")
        }
    }
}
```

## Default Date Ranges

By default, this package uses the following date ranges for each zodiac sign:

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

## Important Notes

- This package is locale-independent and assumes a Gregorian calendar.
- Error handling is crucial when dealing with `ZodiacService`. Make sure to catch and properly handle any exceptions that may be thrown.

## Contributing

Contributions are more than welcome. If you find a bug or have an idea for an enhancement, please open an issue or provide a pull request. Please follow the code style present in the current code base when making contributions.

## License

The Zodiac Signs package is released under the MIT license. See [LICENSE](https://github.com/markbattistella/ZodiacKit/blob/main/LICENCE.md) for more information.
