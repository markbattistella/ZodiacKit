// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "ZodiacKit",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.macCatalyst(.v13),
		.tvOS(.v13)
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
			path: "Sources"
		),
        .testTarget(
            name: "ZodiacKitTests",
            dependencies: ["ZodiacKit"],
			path: "Tests"
		)
    ]
)
