// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ZodiacKit",
    defaultLocalization: "en",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
		.macCatalyst(.v15),
		.tvOS(.v15),
        .watchOS(.v8),
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
            resources: [.process("Resources")]
		),
        .testTarget(
            name: "ZodiacKitTests",
            dependencies: ["ZodiacKit"],
			path: "Tests"
		)
    ]
)
