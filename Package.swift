// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OrzSPMRegistry",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession.git", from: "1.0.0"),
        .package(url: "https://github.com/swift-server/swift-openapi-vapor", from: "1.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.91.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Server",
            dependencies: ["Service"]),
        .target(
            name: "Service",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIVapor", package: "swift-openapi-vapor"),
                .product(name: "Vapor", package: "vapor"),
            ],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ]
        ),
        .testTarget(
            name: "ServiceTests",
            dependencies: ["Service"]),
        .target(
            name: "Client",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
            ],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ]
        ),
        .testTarget(
            name: "ClientTests",
            dependencies: ["Client"]),
    ]
)
