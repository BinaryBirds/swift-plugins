//
//  CheckBrokenSymlinksScript.swift
//
//  Created by gerp83 on 06/06/2024
//

struct CheckBrokenSymlinksScript: ScriptProtocol {
    
    func shFile() -> String {
        return "check-broken-symlinks.sh"
    }
    
    func scriptToRun() -> String {
        return """
        \(ScriptEnum.head.rawValue)
        \(ScriptEnum.log.rawValue)
        \(ScriptEnum.directories.rawValue)

        log "Checking for broken symlinks..."
        NUM_BROKEN_SYMLINKS=0
        while read -r -d '' file; do
            if ! test -e "${REPO_ROOT}/${file}"; then
                log "Broken symlink: ${file}"
                ((NUM_BROKEN_SYMLINKS++))
            fi
        done < <(git -C "${REPO_ROOT}" ls-files -z)

        if [ "${NUM_BROKEN_SYMLINKS}" -gt 0 ]; then
            log "❌ Found ${NUM_BROKEN_SYMLINKS} broken symlinks."
            exit 1
        fi

        log "✅ Found 0 broken symlinks."
        """
    }
    
}
