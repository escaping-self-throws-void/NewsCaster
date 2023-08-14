// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "NewsFeature", targets: ["NewsFeature"])
    ],
    dependencies: [
        .package(path: "Data"),
        .package(path: "Core"),
    ],
    targets: [
        .target(
            name: "NewsFeature",
            dependencies: [
                .product(name: "Domain", package: "Data"),
                .product(name: "Utilities", package: "Core"),
            ]
        ),
        .testTarget(
            name: "FeaturesTests",
            dependencies: ["NewsFeature"]
        ),
    ]
)
