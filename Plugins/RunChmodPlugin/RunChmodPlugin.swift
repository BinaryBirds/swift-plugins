//
//  File.swift
//
//  Created by gerp83 on 21/06/2024
//

import PackagePlugin

@main
struct RunChmodPlugin: CommandPlugin {

    func performCommand(
        context: PackagePlugin.PluginContext,
        arguments: [String]
    ) async throws {
        try context.runScript(RunChmodScript())
    }

}
