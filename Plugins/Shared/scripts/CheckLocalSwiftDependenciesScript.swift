//
//  CheckLocalSwiftDependenciesScript.swift
//
//  Created by gerp83 on 06/06/2024
//

struct CheckLocalSwiftDependenciesScript: ScriptProtocol {
    
    func shFile() -> String {
        return "check-local-swift-dependencies.sh"
    }
    
    func scriptToRun() -> String {
        return """
        \(ScriptEnum.head.rawValue)
        \(ScriptEnum.log.rawValue)
        \(ScriptEnum.directories.rawValue)

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
    
}
