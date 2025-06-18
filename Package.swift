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
            url: "https://storage.googleapis.com/sarj-sandbox-public/NouraSDK/iOS/v0.2.5/NouraSDK.xcframework.zip",
            checksum: "2bc5b18e4034c97a5d02b2aed81c18c6a0fa8d329d2b9fadbb61bfbb4020a743"
        )
    ]
)
