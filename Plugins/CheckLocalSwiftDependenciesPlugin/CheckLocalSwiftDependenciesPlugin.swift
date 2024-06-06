//
//  CheckLocalSwiftDependenciesPlugin.swift
//  
//
//  Created by Lengyel Gábor on 05/06/2024.
//

import Foundation
import PackagePlugin

@main
struct CheckLocalSwiftDependenciesPlugin: CommandPlugin {
    
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        try context.runScript(CheckLocalSwiftDependenciesScript())
    }
    
}
