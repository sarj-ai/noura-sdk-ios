// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "NouraSDK",
    platforms: [
        .iOS(.v16),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "NouraSDK",
            targets: ["NouraSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "NouraSDK",
            url: "https://storage.googleapis.com/sarj-sandbox-public/NouraSDK/iOS/v0.3.4/NouraSDK.xcframework.zip",
            checksum: "0d1cbb744a71c7fd4c5f8c212e181a90e15b634479dd3c3e30a54b925b2563a4"
        )
    ]
)
