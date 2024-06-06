//
//  GenerateContributorsListScript.swift
//
//  Created by gerp83 on 06/06/2024
//

struct GenerateContributorsListScript: ScriptProtocol {

    func shFile() -> String {
        return "generate-contributors-list.sh"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

            contributors=$( git shortlog -sne --all | cut -f2 | sed 's/^/- /' )
            cat > "$REPO_ROOT/CONTRIBUTORS.txt" <<- EOF
            ### Contributors
            $contributors

            **Updating this list**

            Please do not edit this file manually. It is generated using \\`bash generate-contributors-list.sh\\`.
            If a name is misspelled or appearing multiple times: add an entry in \\`./.mailmap\\`.
            EOF
            """
    }

}
