//
//  RunCleanPlugin.swift
//  
//
//  Created by Lengyel Gábor on 06/06/2024.
//

import Foundation
import PackagePlugin

@main
struct RunCleanPlugin: CommandPlugin {
    
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        try context.runScript(RunCleanScript())
    }
    
}
