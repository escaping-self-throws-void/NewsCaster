// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Domain", targets: ["Domain"])
    ],
    dependencies: [
        .package(path: "Core"),
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "Networking", package: "Core"),
                .product(name: "Utilities", package: "Core")
            ]
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Domain"]
        ),
    ]
)
