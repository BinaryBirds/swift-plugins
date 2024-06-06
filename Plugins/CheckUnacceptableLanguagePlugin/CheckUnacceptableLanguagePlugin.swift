//
//  CheckUnacceptableLanguagePlugin.swift
//
//  Created by gerp83 on 06/06/2024
//

import PackagePlugin

@main
struct CheckUnacceptableLanguagePlugin: CommandPlugin {

    func performCommand(
        context: PackagePlugin.PluginContext,
        arguments: [String]
    ) async throws {
        let _ = try context.createFile(
            fileName: "unacceptable-language.txt",
            fileContent: ScriptEnum.defaultUnaccepableLanguageValues.rawValue
        )
        try context.runScript(CheckUnaccepableLanguageScript())
    }

}
