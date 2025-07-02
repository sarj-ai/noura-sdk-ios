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
            url: "https://storage.googleapis.com/sarj-sandbox-public/NouraSDK/iOS/v0.3.3/NouraSDK.xcframework.zip",
            checksum: "f9bf9f87044f535fd7ccb35b9ff8767e7776168c40d58330e8ab9f740820a8d2"
        )
    ]
)
