// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "ZodiacKit",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_13),
		.macCatalyst(.v13),
		.tvOS(.v11)
	],
    products: [
        .library(
            name: "ZodiacKit",
            targets: ["ZodiacKit"]
		)
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ZodiacKit",
            dependencies: []
		),
        .testTarget(
            name: "ZodiacKitTests",
            dependencies: ["ZodiacKit"]
		)
    ]
)
