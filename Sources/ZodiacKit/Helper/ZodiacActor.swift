//
// Project: 
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A global actor to manage concurrency for shared resources.
///
/// The `GlobalActor` is used to ensure that certain shared resources are accessed
/// in a thread-safe manner. By isolating code to this actor, we prevent data races
/// and ensure safe access to globally accessible variables.
///
/// Usage:
/// ```swift
/// @ZodiacActor
/// public var sharedResource: SomeType = ...
///
/// @ZodiacActor
/// public func performThreadSafeOperation() {
///     // Code that interacts with sharedResource
/// }
/// ```
///
/// You can also use `await` to call functions isolated to this actor:
/// ```swift
/// await GlobalActor.run {
///     performThreadSafeOperation()
/// }
/// ```
///
/// - Note: Make sure to use the `@ZodiacActor` attribute to isolate global variables or functions.
@globalActor
public actor ZodiacActor {

    /// The shared instance of the global actor.
    public static let shared = ZodiacActor()
}
