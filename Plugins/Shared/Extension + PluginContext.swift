//
//  Extension + PluginContext.swift
//
//  Created by gerp83 on 05/06/2024
//

import Foundation
import PackagePlugin

//Sharing data between plugins are limited and need to use symlinking, maybe in the future, this
//can be shared more easily between plugins
//more info here:
//https://forums.swift.org/t/difficulty-sharing-code-between-swift-package-manager-plugins/61690/6
extension PackagePlugin.PluginContext {

    func createFile(fileName: String, fileContent: String) throws -> String {
        let filePath = self.pluginWorkDirectory.appending(fileName).string
        let fm = FileManager.default

        // check if file exist
        if !fm.fileExists(atPath: filePath) {
            do {
                // create and write to file
                try fileContent.write(
                    toFile: filePath,
                    atomically: true,
                    encoding: String.Encoding.utf8
                )
            }
            catch let error {
                print(error.localizedDescription)
            }
        }

        return filePath
    }

    func runScript(
        _ script: ScriptProtocol,
        _ arguments: [String]? = nil
    ) throws {
        let scriptFilePath = try createFile(
            fileName: script.shFile(),
            fileContent: script.scriptToRun()
        )

        let tool = try self.tool(named: "bash")
        let process = Process()
        process.launchPath = tool.path.string

        if let arguments = arguments {
            process.arguments = [scriptFilePath] + arguments
        }
        else {
            process.arguments = [scriptFilePath]
        }

        try process.run()
        process.waitUntilExit()
    }

}
