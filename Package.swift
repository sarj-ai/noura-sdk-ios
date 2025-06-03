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
            url: "https://storage.googleapis.com/sarj-sandbox-public/NouraSDK/iOS/v0.2.2/NouraSDK.xcframework.zip",
            checksum: "9b87d7a18433bab2fa3d171b1fe43c86725c478355f11d2c57e51db988d5b9ac"
        )
    ]
)
