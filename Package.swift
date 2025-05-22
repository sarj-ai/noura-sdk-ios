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
            url: "https://storage.googleapis.com/sarj-sandbox-public/NouraSDK/iOS/v0.1.1/NouraSDK.xcframework.zip",
            checksum: "a2841816c6c2f30da6bee87f5ac6e05f444867bcc0264816746a384af7f7ad39"
        )
    ]
)
