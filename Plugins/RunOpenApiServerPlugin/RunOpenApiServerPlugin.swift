//
//  RunOpenApiServerPlugin.swift
//
//  Created by gerp83 on 07/06/2024
//

import PackagePlugin

@main
struct RunOpenApiServerPlugin: CommandPlugin {

    func performCommand(
        context: PackagePlugin.PluginContext,
        arguments: [String]
    ) async throws {
        try context.runScript(RunOpenApiServerScript(), arguments)
    }

}
