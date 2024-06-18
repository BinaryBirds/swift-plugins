//
//  CheckBrokenSymlinksPlugin.swift
//
//  Created by gerp83 on 05/06/2024
//

import PackagePlugin

@main
struct CheckBrokenSymlinksPlugin: CommandPlugin {

    func performCommand(
        context: PackagePlugin.PluginContext,
        arguments: [String]
    ) async throws {
        try context.runScript(CheckBrokenSymlinksScript())
    }

}
