// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "AdMobUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AdMobUI",
            targets: ["AdMobUI"]),
    ],
    dependencies: [
        .package(
            name: "GoogleMobileAds",
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            .upToNextMajor(from: "11.5.0")
        ),
        .package(
            name: "KeyWindow",
            url: "https://github.com/briannadoubt/KeyWindow.git",
            .upToNextMajor(from: "0.1.0")
        )
    ],
    targets: [
        .target(
            name: "AdMobUI",
            dependencies: [
                .product(
                    name: "GoogleMobileAds",
                    package: "GoogleMobileAds",
                    condition: .when(platforms: [.iOS])
                ),
                .product(
                    name: "KeyWindow",
                    package: "KeyWindow",
                    condition: .when(platforms: [.iOS])
                )
            ],
            linkerSettings: [
                .linkedFramework("SwiftUI", .when(platforms: [.iOS])),
                .linkedFramework("Foundation", .when(platforms: [.iOS]))
            ]
        )//,
//        .testTarget(
//            name: "AdMobUITests",
//            dependencies: ["AdMobUI"]
//        )
    ]
)
