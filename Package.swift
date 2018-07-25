// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftyNames",
    products: [
        .library(name: "SwiftyNames", targets: ["SwiftyNames"]),
    ],
    targets: [
        .target(name: "SwiftyNames", dependencies: [], path: "Sources"),
        .testTarget(
            name: "SwiftyNamesTests",
            dependencies: ["SwiftyNames"],
            path: "SwiftyNamesTests"
        ),
    ]
)
