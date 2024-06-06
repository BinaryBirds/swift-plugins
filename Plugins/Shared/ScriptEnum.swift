//
//  ScriptEnum.swift
//
//  Created by gerp83 on 06/06/2024
//

public enum ScriptEnum: String {
    
    case head = """
    #!/usr/bin/env bash
    set -euo pipefail
    """
    
    case log = """
    log() { printf -- "%s\\n" "$*" >&2; }
    """
    
    case directories = """
    CURRENT_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    chmod -R oug+x "${CURRENT_SCRIPT_DIR}"
    REPO_ROOT="$(git -C "$PWD" rev-parse --show-toplevel)"
    """
    
}
