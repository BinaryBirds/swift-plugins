//
//  RunCleanScript.swift
//
//  Created by gerp83 on 06/06/2024
//

struct RunCleanScript: ScriptProtocol {

    func shFile() -> String {
        return "run-clean.sh"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

            rm -rf ".build"
            rm -rf ".swiftpm"
            rm -f "openapi/openapi.yaml"
            rm -f "db.sqlite"
            rm -f "migration-entries.json"
            """
    }

}
