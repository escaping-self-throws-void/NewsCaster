// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Networking", targets: ["Networking"] ),
        .library(name: "Logs", targets: ["Logs"]),
        .library(name: "Utilities", targets: ["Utilities"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "Networking", dependencies: ["Logs"]),
        .target(name: "Logs"),
        .target(name: "Utilities"),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Utilities", "Networking"],
            resources: [ .process("Mocks/MockJSON.json")]
        ),
    ]
)
