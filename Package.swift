import PackageDescription

let package = Package(
    name: "HKDF",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/BlueCryptor.git", majorVersion: 0, minor: 8),
    ]
)
