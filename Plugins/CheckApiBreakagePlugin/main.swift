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
        
        print("")
        print(context.pluginWorkDirectory.removingLastComponent())
        print(context.package.directory)
        
        
        let hackyPath = context.package.directory.string + "/.build/checkouts/swift-plugins"
        try performCommand(context, "sh", [hackyPath + "/scripts/check-api-breakage.sh"], arguments)
    }
    
    private func listDir(path: Path) {
        let fm = FileManager.default
        do {
            let items = try fm.contentsOfDirectory(atPath: path.string)

            for item in items {
                print("Found \(item)")
            }
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
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
