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

            # Fetch all tags from the remote repository
            git fetch -t

            # Get the latest commit hash that has a tag
            REV_LIST=$(git rev-list --tags --max-count=1)

            # Check if REV_LIST is not empty
            if [ ! -z "${REV_LIST}" ]; then
                # Get the latest tag associated with the commit hash
                LATEST_TAG=$(git describe --tags ${REV_LIST})

                # Run the Swift package API breakage diagnosis tool and redirect output to a log file
                swift package diagnose-api-breaking-changes "$LATEST_TAG" 2>&1 > api-breakage-output.log || {
                    NUM=$(cat api-breakage-output.log|grep "💔"|wc -l)
                    log "❌ Found ${NUM} API breakages."
                    cat api-breakages.log
                    exit 0
                }
                log "✅ Found no API breakages."
            else
                log "✅ The repository has no tags yet."
            fi
            """
    }

}
