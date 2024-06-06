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
        .plugin(name: "RunCleanPlugin", targets: ["RunCleanPlugin"]),
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
            name: "RunCleanPlugin",
            capability: .command(
                intent: .custom(
                    verb: "run-clean",
                    description: "runs run-clean.sh"
                )
            ),
            dependencies: []
        ),
    ]
)
