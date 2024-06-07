// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-plugins",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .plugin(name: "CheckApiBreakagePlugin", targets: ["CheckApiBreakagePlugin"]),
        .plugin(name: "CheckBrokenSymlinksPlugin", targets: ["CheckBrokenSymlinksPlugin"]),
        .plugin(name: "CheckLocalSwiftDependenciesPlugin", targets: ["CheckLocalSwiftDependenciesPlugin"]),
        .plugin(name: "CheckOpenApiSecurityPlugin", targets: ["CheckOpenApiSecurityPlugin"]),
        .plugin(name: "CheckOpenApiValidationPlugin", targets: ["CheckOpenApiValidationPlugin"]),
        .plugin(name: "CheckUnacceptableLanguagePlugin", targets: ["CheckUnacceptableLanguagePlugin"]),
        .plugin(name: "GenerateContributorsListPlugin", targets: ["GenerateContributorsListPlugin"]),
        .plugin(name: "InstallSwiftFormatPlugin", targets: ["InstallSwiftFormatPlugin"]),
        .plugin(name: "InstallSwiftOpenApiGeneratorPlugin", targets: ["InstallSwiftOpenApiGeneratorPlugin"]),
        .plugin(name: "RunCleanPlugin", targets: ["RunCleanPlugin"]),
        .plugin(name: "RunOpenApiServerPlugin", targets: ["RunOpenApiServerPlugin"]),
        .plugin(name: "RunSwiftFormatPlugin", targets: ["RunSwiftFormatPlugin"]),
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "CheckApiBreakagePlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-api-breakage",
                    description: "runs check-api-breakage.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "CheckBrokenSymlinksPlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-broken-symlinks",
                    description: "runs check-broken-symlinks.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "CheckLocalSwiftDependenciesPlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-local-swift-dependencies",
                    description: "runs check-local-swift-dependencies.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "CheckOpenApiSecurityPlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-openapi-security",
                    description: "runs check-openapi-security.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "CheckOpenApiValidationPlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-openapi-validation",
                    description: "runs check-openapi-validation.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "CheckUnacceptableLanguagePlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-unacceptable-language",
                    description: "runs check-unacceptable-language.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "GenerateContributorsListPlugin",
            capability: .command(
                intent: .custom(
                    verb: "generate-contributors-list",
                    description: "runs generate-contributors-list.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "InstallSwiftFormatPlugin",
            capability: .command(
                intent: .custom(
                    verb: "install-swift-format",
                    description: "runs install-swift-format.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "InstallSwiftOpenApiGeneratorPlugin",
            capability: .command(
                intent: .custom(
                    verb: "install-swift-openapi-generator",
                    description: "runs install-swift-openapi-generator.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "RunCleanPlugin",
            capability: .command(
                intent: .custom(
                    verb: "run-clean",
                    description: "runs run-clean.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "RunOpenApiServerPlugin",
            capability: .command(
                intent: .custom(
                    verb: "run-swift-format",
                    description: "runs run-swift-format.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "RunSwiftFormatPlugin",
            capability: .command(
                intent: .custom(
                    verb: "run-openapi-server",
                    description: "runs run-openapi-server.sh"
                )
            ),
            dependencies: []
        ),
    ]
)
