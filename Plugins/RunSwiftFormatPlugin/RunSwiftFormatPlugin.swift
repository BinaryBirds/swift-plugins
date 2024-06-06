//
//  RunSwiftFormatPlugin.swift
//
//  Created by gerp83 on 06/06/2024
//

import PackagePlugin

@main
struct RunSwiftFormatPlugin: CommandPlugin {

    func performCommand(
        context: PackagePlugin.PluginContext,
        arguments: [String]
    ) async throws {
        let _ = try context.createFile(
            fileName: ".swift-format",
            fileContent: ScriptEnum.defaultSwiftFormatConfig.rawValue
        )
        try context.runScript(RunSwiftFormatScript(), arguments)
    }

}
