//
//  File.swift
//  
//
//  Created by Lengyel Gábor on 05/06/2024.
//

import Foundation
import PackagePlugin

@main
struct CheckApiBreakagePlugin: CommandPlugin {
    
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        try performCommand(context, "make", ["check-api-breakage"], arguments)
    }
    
    private func performCommand(
        _ context: PackagePlugin.PluginContext,
        _ toolName: String,
        _ processArguments: [String],
        _ arguments: [String]
    ) throws {
        let tool = try context.tool(named: toolName)
        let process = Process()
        process.launchPath = tool.path.string
        process.arguments = processArguments
        try process.run()
        process.waitUntilExit()
    }
    
}
