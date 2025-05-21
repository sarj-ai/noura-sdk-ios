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
            url: "https://storage.cloud.google.com/sarj-sandbox-public/NouraSDK/iOS/v0.1.0/NouraSDK.xcframework.zip",
            checksum: "e294fb4acb2b9f053b75c989034a6e3de68b4ff5b192d5f67116f445b13a6df8"
        )
    ]
)
