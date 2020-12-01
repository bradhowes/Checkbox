// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Checkbox",
    platforms: [
         // could be smaller but this is min for SnapshotTesting
        .iOS(.v11)
    ],
    products: [
        .library(name: "Checkbox", targets: ["Checkbox"]),
    ],
    dependencies: [
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.8.1")
    ],
    targets: [
        .target(name: "Checkbox", dependencies: [], exclude: ["Checkbox.playground"]),
        .testTarget(name: "CheckboxTests", dependencies: ["Checkbox", "SnapshotTesting"], exclude: ["__Snapshots__"]),
    ]
)
