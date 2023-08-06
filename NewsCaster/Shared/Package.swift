// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "API", targets: ["API"] ),
    ],
    dependencies: [
        .package(path: "Core"),
    ],
    targets: [
        .target(name: "API", dependencies: [
            .product(name: "Networking", package: "Core"),
            .product(name: "Utilities", package: "Core"),
        ]),
        .testTarget(
            name: "SharedTests",
            dependencies: ["API"],
            resources: [ .process("MockResponse.json")]
        ),
    ]
)
