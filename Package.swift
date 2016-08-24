import PackageDescription

let package = Package(
    name: "HKDF",
    dependencies: [
        .Package(url: "https://github.com/Bouke/CommonCrypto.git", majorVersion: 1),
    ]
)
