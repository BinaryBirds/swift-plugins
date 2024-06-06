//
//  CheckUnaccepableLanguageScript.swift
//
//  Created by gerp83 on 06/06/2024
//

struct CheckUnaccepableLanguageScript: ScriptProtocol {
    
    func shFile() -> String {
        return "check-unacceptable-language.sh"
    }
    
    func scriptToRun() -> String {
        return """
        \(ScriptEnum.head.rawValue)
        \(ScriptEnum.log.rawValue)
        \(ScriptEnum.directories.rawValue)
        
        UNACCEPTABLE_LANGUAGE_PATTERNS_PATH="${REPO_ROOT}/unacceptable-language.txt"
        log "Checking for unacceptable language..."

        if ! test -f ${UNACCEPTABLE_LANGUAGE_PATTERNS_PATH}; then
            UNACCEPTABLE_LANGUAGE_PATTERNS_PATH="${CURRENT_SCRIPT_DIR}/unacceptable-language"
            log "❗ There was no 'unacceptable-language.txt' file in the repository, so using the default values for the search."

            PATHS_WITH_UNACCEPTABLE_LANGUAGE=$(git -C "${REPO_ROOT}" grep \
            -l -F -w \
            -f "${UNACCEPTABLE_LANGUAGE_PATTERNS_PATH}" \
            ) || true | /usr/bin/paste -s -d " " -

        else
            PATHS_WITH_UNACCEPTABLE_LANGUAGE=$(git -C "${REPO_ROOT}" grep \
            -l -F -w \
            -f "${UNACCEPTABLE_LANGUAGE_PATTERNS_PATH}" \
            -- ":(exclude)${UNACCEPTABLE_LANGUAGE_PATTERNS_PATH}" \
            ) || true | /usr/bin/paste -s -d " " -
        fi

        if [ -n "${PATHS_WITH_UNACCEPTABLE_LANGUAGE}" ]; then
            log "❌ Found unacceptable language in files:"
            log "${PATHS_WITH_UNACCEPTABLE_LANGUAGE}"
            exit 1
        fi

        log "✅ Found no unacceptable language."
        """
    }
    
}
