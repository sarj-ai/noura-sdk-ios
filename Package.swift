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
            url: "https://storage.googleapis.com/sarj-sandbox-public/NouraSDK/iOS/v0.2.3/NouraSDK.xcframework.zip",
            checksum: "85cffee687801d3b89ee00635caa5ae1b77f9d5730cf4aa5e67e239739860ea8"
        )
    ]
)
