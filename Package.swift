// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "HKDF",
    products: [
        .library(name: "HKDF", targets: ["HKDF"])
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/BlueCryptor.git", from: "0.8.0")
    ],
    targets: [
        .target(name: "HKDF", dependencies: ["Cryptor"], path: "Sources"),
        .testTarget(name: "HKDFTests", dependencies: ["HKDF"])
    ],
    swiftLanguageVersions: [4]
)
