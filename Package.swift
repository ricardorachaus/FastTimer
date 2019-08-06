// swift-tools-version:5.0
//
//  FastTimer.swift
//  FastTimer
//
//  Created by Ricardo Rachaus on 01/04/19.
//  Copyright © 2019 ricardorachaus. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "FastTimer",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: [
        .library(
            name: "FastTimer",
            targets: ["FastTimer"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "FastTimer",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "FastTimerTests",
            dependencies: ["FastTimer"],
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
