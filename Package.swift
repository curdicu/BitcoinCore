// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "BitcoinCore",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "BitcoinCore",
            targets: ["BitcoinCore"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Brightify/Cuckoo.git", .upToNextMajor(from: "1.5.0")),
        .package(url: "https://github.com/groue/GRDB.swift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "5.0.1")),

        .package(url: "https://github.com/curdicu/Checkpoints.git", .branch( "main")),
        .package(url: "https://github.com/curdicu/HdWalletKit.git", .branch( "main")),
        .package(url: "https://github.com/curdicu/HsCryptoKit.git", .branch( "main")),
        .package(url: "https://github.com/curdicu/HsExtensions.git", .branch( "main")),
        .package(url: "https://github.com/curdicu/HsToolKit.git", .branch( "main")),
    ],
    targets: [
        .target(
            name: "BitcoinCore",
            dependencies: [
                "BigInt",
                "Checkpoints",
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "HdWalletKit", package: "HdWalletKit"),
                .product(name: "HsCryptoKit", package: "HsCryptoKit"),
                .product(name: "HsExtensions", package: "HsExtensions"),
                .product(name: "HsToolKit", package: "HsToolKit"),
            ]
        ),
        .testTarget(
            name: "BitcoinCoreTests",
            dependencies: [
                "BitcoinCore",
                "Cuckoo",
                "Nimble",
                "Quick",
            ]
        ),
    ]
)
