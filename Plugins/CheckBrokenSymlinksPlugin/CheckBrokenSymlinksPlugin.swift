//
//  File.swift
//  
//
//  Created by Lengyel Gábor on 05/06/2024.
//

import Foundation
import PackagePlugin

@main
struct CheckBrokenSymlinksPlugin: CommandPlugin {
    
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        try context.runShFile("check-broken-symlinks.sh", scriptToRun)
    }
    
    let scriptToRun = """
        #!/usr/bin/env bash
        set -euo pipefail

        log() { printf -- "%s\n" "$*" >&2; }

        REPO_ROOT="$(git -C "$PWD" rev-parse --show-toplevel)"

        log "Checking for broken symlinks..."
        NUM_BROKEN_SYMLINKS=0
        while read -r -d '' file; do
          if ! test -e "${REPO_ROOT}/${file}"; then
            log "Broken symlink: ${file}"
            ((NUM_BROKEN_SYMLINKS++))
          fi
        done < <(git -C "${REPO_ROOT}" ls-files -z)

        if [ "${NUM_BROKEN_SYMLINKS}" -gt 0 ]; then
          log "❌ Found ${NUM_BROKEN_SYMLINKS} symlinks."
          exit 1;
        fi

        log "✅ Found 0 symlinks."
    """
    
}
