//
//  File.swift
//
//  Created by gerp83 on 21/06/2024
//

struct RunChmodScript: ScriptProtocol {

    func shFile() -> String {
        return "run-chmod.sh"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

            chmod -R oug+x "${REPO_ROOT}/.build/plugins/"
            """
    }

}
