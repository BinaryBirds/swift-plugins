//
//  InstallSwiftFormatScript.swift
//
//  Created by gerp83 on 07/06/2024
//
    
struct InstallSwiftFormatScript: ScriptProtocol {

    func shFile() -> String {
        return "install-swift-format.sh"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

            #https://github.com/apple/swift-format
            VERSION="510.1.0"

            curl -L -o "${VERSION}.tar.gz" "https://github.com/apple/swift-format/archive/refs/tags/${VERSION}.tar.gz"
            tar -xf "${VERSION}.tar.gz"
            cd "swift-format-${VERSION}"
            swift build -c release
            install .build/release/swift-format /usr/local/bin/swift-format
            cd ..
            rm -f "${VERSION}.tar.gz"
            rm -rf "swift-format-${VERSION}"
            """
    }

}
