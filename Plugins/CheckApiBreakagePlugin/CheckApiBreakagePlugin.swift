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
        try context.runShFile("check-api-breakage.sh", scriptToRun)
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
