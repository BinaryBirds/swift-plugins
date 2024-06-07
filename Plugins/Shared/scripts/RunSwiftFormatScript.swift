//
//  RunSwiftFormatScript.swift
//
//  Created by gerp83 on 06/06/2024
//

struct RunSwiftFormatScript: ScriptProtocol {

    func shFile() -> String {
        return "run-swift-format.sh"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

            # Check if SWIFTFORMAT_BIN is set, otherwise find the swift-format binary in the PATH
            SWIFTFORMAT_BIN=${SWIFTFORMAT_BIN:-$(command -v swift-format)}
            
            # If SWIFTFORMAT_BIN is not set, log an error message
            if [[ -z "${SWIFTFORMAT_BIN}" ]]; then
                log "❌ SWIFTFORMAT_BIN unset and no swift-format on PATH"
                exit 1
            fi
             
            SWIFT_FORMAT_JSON_PATH="${REPO_ROOT}/.swift-format"
            
            # Check if the swift-format configuration file exists in the repository
            if ! test -f ${SWIFT_FORMAT_JSON_PATH}; then
            
                # If not found, use the configuration file from the current script directory
                SWIFT_FORMAT_JSON_PATH="${CURRENT_SCRIPT_DIR}/.swift-format"
                log "❗ There was no ‘.swift-format’ file in the repository, so using the one included with the plugin."
            fi

            # Default format command to lint with strict mode
            FORMAT_COMMAND=(lint --strict)
            
            # Check if any arguments are passed and if "--fix" is among them, change the command to format in place
            for arg in "$@"; do
              if [ "$arg" == "--fix" ]; then
                FORMAT_COMMAND=(format --in-place)
              fi
            done

            # Find all Swift files in the repository, excluding 'Package.swift', and run the swift-format command on them
            git -C "${REPO_ROOT}" ls-files -z '*.swift' \
            | grep -z -v \
            -e 'Package.swift' \
            | xargs -0 "${SWIFTFORMAT_BIN}" "${FORMAT_COMMAND[@]}" --configuration "${SWIFT_FORMAT_JSON_PATH}" --parallel \
            && SWIFT_FORMAT_RC=$? || SWIFT_FORMAT_RC=$?

            # Check the exit code of the swift-format command
            if [ "${SWIFT_FORMAT_RC}" -ne 0 ]; then
                log "❌ Running swift-format produced errors."
                log "To fix, run the following command:"
                log "swift package run-swift-format --fix --disable-sandbox"
                exit 1
            fi
            log "✅ Ran swift-format with no errors."
            """
    }

}
