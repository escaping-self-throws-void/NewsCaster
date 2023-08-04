// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Networking", targets: ["Networking"] ),
        .library(name: "Logs", targets: ["Logs"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "Networking", dependencies: ["Logs"]),
        .target(name: "Logs"),
//        .testTarget(
//            name: "CoreTests",
//            dependencies: ["Core"]),
    ]
)
