//
//  CheckOpenApiSecurityScript.swift
//
//  Created by gerp83 on 07/06/2024
//

struct CheckOpenApiSecurityScript: ScriptProtocol {

    func shFile() -> String {
        return "check-openapi-security.sh"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

            OPENAPI_YAML_LOCATION="${REPO_ROOT}/openapi";
            # Check if the OpenAPI directory exists
            if ! [ -d ${OPENAPI_YAML_LOCATION} ]; then
                log "❗Openapi location not found."
                exit 0
            fi

            # Run the owasp/zap2docker-weekly Docker container to check the OpenAPI YAML file for security issues
            docker run --rm --name "check-openapi-security" \
                -v "${OPENAPI_YAML_LOCATION}:/app" \
                -t owasp/zap2docker-weekly zap-api-scan.py \
                -t /app/openapi.yaml -f openapi
            """
    }

}
