//
//  RunCleanPlugin.swift
//  
//  Created by gerp83 on 06/06/2024
//

import PackagePlugin

@main
struct RunCleanPlugin: CommandPlugin {
    
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        try context.runScript(RunCleanScript())
    }
    
}
