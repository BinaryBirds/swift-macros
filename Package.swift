// swift-tools-version: 5.9
import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "swift-macros",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .executable(
            name: "Examples",
            targets: ["Examples"]
        ),
        .library(
            name: "SwiftMacros",
            targets: ["SwiftMacros"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-syntax.git",
            branch: "main"
        ),
    ],
    targets: [
        .macro(
            name: "SwiftMacrosPlugin",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftOperators", package: "swift-syntax"),
                .product(name: "SwiftParser", package: "swift-syntax"),
                .product(name: "SwiftParserDiagnostics", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        .target(
            name: "SwiftMacros",
            dependencies: [
                "SwiftMacrosPlugin"
            ]
        ),
        .executableTarget(
            name: "Examples",
            dependencies: [
                "SwiftMacros"
            ]
        ),
        .testTarget(
            name: "SwiftMacrosTests",
            dependencies: [
                "SwiftMacrosPlugin"
            ]
        )
    ]
)

