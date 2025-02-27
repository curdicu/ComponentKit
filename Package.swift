// swift-tools-version:5.5

import PackageDescription

let package = Package(
        name: "ComponentKit",
        platforms: [
            .iOS(.v13),
        ],
        products: [
            .library(
                    name: "ComponentKit",
                    targets: ["ComponentKit"]),
        ],
        dependencies: [
            .package(url: "https://github.com/Juanpe/SkeletonView.git", from: "1.7.0"),
            .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
            .package(url: "https://github.com/curdicu/HUD.git", .branch("main")),
            .package(url: "https://github.com/curdicu/SectionsTableView.git", .branch("main")),
            .package(url: "https://github.com/curdicu/ThemeKit.git" , .branch("main")),
            // .package(url: "https://github.com/curdicu/UIExtensions.git", .branch( "main")),
            .package(url: "https://github.com/horizontalsystems/UIExtensions.Swift.git", .upToNextMajor(from: "1.0.0")),
        ],
        targets: [
            .target(
                    name: "ComponentKit",
                    dependencies: [
                        "SkeletonView",
                        "SnapKit",
                        .product(name: "HUD", package: "HUD"),
                        .product(name: "SectionsTableView", package: "SectionsTableView"),
                        .product(name: "ThemeKit", package: "ThemeKit"),
                        .product(name: "UIExtensions", package: "UIExtensions.Swift"),
                    ]
            ),
        ]
)
