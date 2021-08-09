// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "yotpoKit",
    platforms: [
        .iOS(.v12),
        .tvOS(.v10),
        .watchOS(.v3),
        .macOS(.v10_15)
    ],
    defaultLocalization: "pt",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "yotpoKit",
            targets: ["yotpoKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "yotpoKit",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "yotpoKitTests",
            dependencies: ["yotpoKit"],
            resources: [.copy: "Info.plist"],
            exclude: ["yotpoUsageExampleTests/Info.plist",
                      "yotpoUsageExample/Info.plist"]),
    ]
)
