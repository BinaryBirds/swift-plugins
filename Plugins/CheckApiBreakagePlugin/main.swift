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
        let scriptFilePath = context.pluginWorkDirectory.appending("check-api-breakage.sh").string
        let fm = FileManager.default
        if !fm.fileExists(atPath: scriptFilePath) {
            do {
                try scriptToRun.write(toFile: scriptFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error{
                print(error.localizedDescription)
            }
        }
        try performCommand(context, "sh", [scriptFilePath], arguments)
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
    
    var scriptToRun = """
        #!/usr/bin/env bash
        set -euo pipefail

        log() { printf -- "%s\n" "$*" >&2; }

        REPO_ROOT="$(git -C "$PWD" rev-parse --show-toplevel)"

        git fetch -t
        REV_LIST=$(git rev-list --tags --max-count=1)
        if [ ! -z "${REV_LIST}" ]; then
            LATEST_TAG=$(git describe --tags ${REV_LIST})
            swift package diagnose-api-breaking-changes "$LATEST_TAG" 2>&1 > api-breakage-output.log || {
                NUM=$(cat api-breakage-output.log|grep "💔"|wc -l)
                log "❌ Found ${NUM} API breakages."
                cat api-breakages.log
                exit 0;
            }
            log "✅ Found no API breakages."
        else
            log "✅ The repository has no tags yet."
        fi
    """
    
}
