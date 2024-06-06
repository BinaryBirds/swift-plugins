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

            SWIFTFORMAT_BIN=${SWIFTFORMAT_BIN:-$(command -v swift-format)}
            if [[ -z "${SWIFTFORMAT_BIN}" ]]; then
                log "❌ SWIFTFORMAT_BIN unset and no swift-format on PATH"
                exit 1
            fi
             
            SWIFT_FORMAT_JSON_PATH="${REPO_ROOT}/.swift-format"
            if ! test -f ${SWIFT_FORMAT_JSON_PATH}; then
                SWIFT_FORMAT_JSON_PATH="${CURRENT_SCRIPT_DIR}/.swift-format"
                log "❗ There was no ‘.swift-format’ file in the repository, so using the one included with the plugin."
            fi

            FORMAT_COMMAND=(lint --strict)
            for arg in "$@"; do
              if [ "$arg" == "--fix" ]; then
                FORMAT_COMMAND=(format --in-place)
              fi
            done

            git -C "${REPO_ROOT}" ls-files -z '*.swift' \
            | grep -z -v \
            -e 'Package.swift' \
            | xargs -0 "${SWIFTFORMAT_BIN}" "${FORMAT_COMMAND[@]}" --configuration "${SWIFT_FORMAT_JSON_PATH}" --parallel \
            && SWIFT_FORMAT_RC=$? || SWIFT_FORMAT_RC=$?

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
