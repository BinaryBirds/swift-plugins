//
//  CheckUnacceptableLanguagePlugin.swift
//  
//  Created by gerp83 on 06/06/2024
//

import PackagePlugin

@main
struct CheckUnacceptableLanguagePlugin: CommandPlugin {
    
    private let defaultUnaccepableLanguageValues = """
    blacklist
    whitelist
    slave
    master
    sane
    sanity
    insane
    insanity
    kill
    killed
    killing
    hang
    hung
    hanged
    hanging
    """
    
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        let _ = try context.createFile(fileName: "unacceptable-language", fileContent: defaultUnaccepableLanguageValues)
        try context.runScript(CheckUnaccepableLanguageScript())
    }
    
}
