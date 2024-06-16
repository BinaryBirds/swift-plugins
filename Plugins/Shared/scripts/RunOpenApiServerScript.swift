//
//  RunOpenApiServerScript.swift
//
//  Created by gerp83 on 07/06/2024
//

struct RunOpenApiServerScript: ScriptProtocol {

    func shFile() -> String {
        return "run-openapi-server"
    }

    func scriptToRun() -> String {
        return """
            \(ScriptEnum.head.rawValue)
            \(ScriptEnum.log.rawValue)
            \(ScriptEnum.directories.rawValue)

            OPENAPI_YAML_LOCATION="${REPO_ROOT}/openapi";

            # Check if the OpenAPI directory exists
            if ! test -f ${OPENAPI_YAML_LOCATION}; then
                log "❗Openapi location not found."
                exit 0
            fi

            # Run the Docker container to serve the OpenAPI files using Nginx
            docker run --rm --name "run-openapi-server" \
                -v "${OPENAPI_YAML_LOCATION}:/usr/share/nginx/html" \
                -p 8888:80 nginx
            """
    }

}
