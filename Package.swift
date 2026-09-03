// swift-tools-version: 6.4
import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "swift-recursion-derivation",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Recursion Derivation", targets: ["Recursion Derivation"]),
        .library(name: "Recursion Derivation Core", targets: ["Recursion Derivation Core"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-either.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-product.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-anamorphism-derivation.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-apomorphism-derivation.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-catamorphism-derivation.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-chronomorphism-derivation.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-hylomorphism-derivation.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-paramorphism-derivation.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-zygomorphism-derivation.git", branch: "main"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", "603.0.2"..<"604.0.0"),
    ],
    targets: [
        .target(name: "Recursion Derivation Core", dependencies: [
            .product(name: "Anamorphism Derivation Core", package: "swift-anamorphism-derivation"),
            .product(name: "Apomorphism Derivation Core", package: "swift-apomorphism-derivation"),
            .product(name: "Catamorphism Derivation Core", package: "swift-catamorphism-derivation"),
            .product(name: "Chronomorphism Derivation Core", package: "swift-chronomorphism-derivation"),
            .product(name: "Hylomorphism Derivation Core", package: "swift-hylomorphism-derivation"),
            .product(name: "Paramorphism Derivation Core", package: "swift-paramorphism-derivation"),
            .product(name: "Zygomorphism Derivation Core", package: "swift-zygomorphism-derivation"),
            .product(name: "SwiftSyntax", package: "swift-syntax"),
        ]),
        .macro(name: "Recursion Derivation Macros", dependencies: [
            "Recursion Derivation Core",
            .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            .product(name: "SwiftSyntax", package: "swift-syntax"),
            .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        ]),
        .target(name: "Recursion Derivation", dependencies: [
            "Recursion Derivation Macros",
            .product(name: "Either", package: "swift-either"),
            .product(name: "Product", package: "swift-product"),
        ]),
        .testTarget(name: "Recursion Derivation Tests", dependencies: [
            "Recursion Derivation",
            .product(name: "Either", package: "swift-either"),
            .product(name: "Product", package: "swift-product"),
        ]),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
