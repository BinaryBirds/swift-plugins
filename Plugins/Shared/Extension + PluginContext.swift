//
//  Extension + PluginContext.swift
//  
//
//  Created by Lengyel Gábor on 05/06/2024.
//

import Foundation
import PackagePlugin

/*
Sharing data between plugins are limited and need to use symlinking, maybe in the future, this
can be shared easily between plugins
more info here:
https://forums.swift.org/t/difficulty-sharing-code-between-swift-package-manager-plugins/61690/6
*/
extension PackagePlugin.PluginContext {
    
    func runScript(_ script: ScriptProtocol) throws {
        
        let scriptFilePath = self.pluginWorkDirectory.appending(script.shFile()).string
        let fm = FileManager.default
        
        // check sh file exist
        if !fm.fileExists(atPath: scriptFilePath) {
            do {
                // create sh file
                try script.scriptToRun().write(toFile: scriptFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error{
                print(error.localizedDescription)
            }
        }
        
        
        let tool = try self.tool(named: "bash")
        let process = Process()
        process.launchPath = tool.path.string
        process.arguments = [scriptFilePath]
        try process.run()
        process.waitUntilExit()
    }
    
    
}
