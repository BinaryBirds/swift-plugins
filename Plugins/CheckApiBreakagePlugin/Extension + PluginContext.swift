//
//  File.swift
//  
//
//  Created by Lengyel Gábor on 05/06/2024.
//

import Foundation
import PackagePlugin

/*
Sharing code/data between plugins are limited and don't wanna use symlinking, maybe in the future, this
can be shared easily between plugins

more info here:
https://forums.swift.org/t/difficulty-sharing-code-between-swift-package-manager-plugins/61690/6
*/
extension PackagePlugin.PluginContext {
    
    func runShFile(
        _ shFileName: String,
        _ scriptToRun: String
    ) throws {
        
        let scriptFilePath = self.pluginWorkDirectory.appending(shFileName).string
        let fm = FileManager.default
        
        // check sh file exist
        if !fm.fileExists(atPath: scriptFilePath) {
            do {
                // create sh file
                try scriptToRun.write(toFile: scriptFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error{
                print(error.localizedDescription)
            }
        }
        
        // run sh file
        let tool = try self.tool(named: "bash")
        let process = Process()
        process.launchPath = tool.path.string
        process.arguments = [scriptFilePath]
        try process.run()
        process.waitUntilExit()
    }
    
    
}
