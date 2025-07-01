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
            url: "https://storage.googleapis.com/sarj-sandbox-public/NouraSDK/iOS/v0.3.1/NouraSDK.xcframework.zip",
            checksum: "5e30cbe33da29e047d253717377640987486bdb698fbaff26b0952390ac96cf4"
        )
    ]
)
