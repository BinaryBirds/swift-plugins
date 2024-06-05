//
//  File.swift
//  
//
//  Created by Lengyel Gábor on 05/06/2024.
//

import Foundation
import PackagePlugin

@main
struct CheckLocalSwiftDependenciesPlugin: CommandPlugin {
    
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        try context.runShFile("check-local-swift-dependencies.sh", scriptToRun)
    }
    
    let scriptToRun = """
    #!/usr/bin/env bash
    set -euo pipefail

    log() { printf -- "%s\n" "$*" >&2; }

    REPO_ROOT="$(git -C "$PWD" rev-parse --show-toplevel)"

    read -ra PATHS_TO_CHECK <<< "$( \
      git -C "${REPO_ROOT}" ls-files -z \
      "Package.swift" \
      | xargs -0 \
    )"
    if [ ! -z ${PATHS_TO_CHECK+x} ]; then   #check for unbound
        for FILE_PATH in "${PATHS_TO_CHECK[@]}"; do
            if [[ $(grep ".package(path:" "${FILE_PATH}"|wc -l) -ne 0 ]] ; then
                log "❌ The '${FILE_PATH}' file contains local Swift package reference(s)."
                exit 1;
            fi
        done
    fi
    log "✅ Found 0 local Swift package dependency references."
    """
    
}
