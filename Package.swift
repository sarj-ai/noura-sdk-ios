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
            url: "https://storage.googleapis.com/sarj-sandbox-public/NouraSDK/iOS/v0.2.0/NouraSDK.xcframework.zip",
            checksum: "0e5e8e5d5767465a292261a0170630add7a63b54384adc74766ce67a24fff25e"
        )
    ]
)
