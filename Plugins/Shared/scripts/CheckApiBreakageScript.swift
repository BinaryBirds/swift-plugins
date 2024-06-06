//
//  CheckApiBreakageScript.swift
//
//  Created by gerp83 on 06/06/2024
//

struct CheckApiBreakageScript: ScriptProtocol {

    func shFile() -> String {
        return "check-api-breakage.sh"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

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

}
