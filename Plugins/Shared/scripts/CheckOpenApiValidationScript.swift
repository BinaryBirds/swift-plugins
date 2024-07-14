//
//  CheckOpenApiValidationScript.swift
//
//  Created by gerp83 on 07/06/2024
//

struct CheckOpenApiValidationScript: ScriptProtocol {

    func shFile() -> String {
        return "check-openapi-validation.sh"
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

            # Run the Docker container to validate the OpenAPI YAML file
            docker run --rm --name "check-openapi-validation" \
                -v "${OPENAPI_YAML_LOCATION}/openapi.yaml:/openapi.yaml" \
                pythonopenapi/openapi-spec-validator /openapi.yaml
            """
    }

}
