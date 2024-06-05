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
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "CheckApiBreakagePlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-api-breakage",
                    description: "runs scripts/check-api-breakage.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "CheckBrokenSymlinksPlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-broken-symlinks",
                    description: "runs scripts/check-broken-symlinks.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "CheckLocalSwiftDependenciesPlugin",
            capability: .command(
                intent: .custom(
                    verb: "check-local-swift-dependencies",
                    description: "runs scripts/check-local-swift-dependencies.sh"
                )
            ),
            dependencies: []
        ),
        .plugin(
            name: "RunChmodPlugin",
            capability: .command(
                intent: .custom(
                    verb: "run-chmod",
                    description: "runs scripts/run-chmod.sh"
                )
            ),
            dependencies: []
        ),
    ]
)
