//
//  InstallSwiftOpenApiGeneratorScript.swift
//
//  Created by gerp83 on 07/06/2024
//
    
struct InstallSwiftOpenApiGeneratorScript: ScriptProtocol {

    func shFile() -> String {
        return "install-swift-openapi-generator.sh"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

            #https://github.com/apple/swift-openapi-generator
            VERSION="1.2.1"

            curl -L -o "${VERSION}.tar.gz" "https://github.com/apple/swift-openapi-generator/archive/refs/tags/${VERSION}.tar.gz"
            tar -xf "${VERSION}.tar.gz"
            cd "swift-openapi-generator-${VERSION}"
            swift build -c release
            install .build/release/swift-openapi-generator /usr/local/bin/swift-openapi-generator
            cd ..
            rm -f "${VERSION}.tar.gz"
            rm -rf "swift-openapi-generator-${VERSION}"
            """
    }

}
