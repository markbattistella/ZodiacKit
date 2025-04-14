// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "ZodiacKit",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.macCatalyst(.v13),
		.tvOS(.v13),
        .watchOS(.v4),
        .visionOS(.v1)
	],
    products: [
        .library(
            name: "ZodiacKit",
            targets: ["ZodiacKit"]
		)
    ],
    targets: [
        .target(
            name: "ZodiacKit",
            dependencies: [],
			path: "Sources",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
		),
        .testTarget(
            name: "ZodiacKitTests",
            dependencies: ["ZodiacKit"],
			path: "Tests"
		)
    ]
)
