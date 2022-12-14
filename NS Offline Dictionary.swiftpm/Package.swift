// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Dictionary",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "Dictionary",
            targets: ["AppModule"],
            bundleIdentifier: "com.nitinseshadri.dictionary",
            teamIdentifier: "DC7TWT94U4",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .openBook),
            accentColor: .presetColor(.cyan),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .outgoingNetworkConnections()
            ],
            appCategory: .reference
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
