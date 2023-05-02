// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

//  Package.swift
//  SecurityKit
//
//  Created by Steven Woolgar on 04/02/2023.
//  Copyright © 2023 Mehran Kamalifard.  All rights reserved.
//

import PackageDescription

let package = Package(
    name: "SecurityKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],

    products: [.library(name: "SecurityKit", targets: ["SecurityKit"])],
    targets: [
        .target(
            name: "SecurityKit",
            path: "SecurityKit/SecurityKit",
            exclude: ["SecurityKit.docc"]
        )
    ],

    swiftLanguageVersions: [.v5]
)
