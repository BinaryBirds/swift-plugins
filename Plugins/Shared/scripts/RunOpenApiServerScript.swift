//
//  RunOpenApiServerScript.swift
//
//  Created by gerp83 on 07/06/2024
//

struct RunOpenApiServerScript: ScriptProtocol {

    func shFile() -> String {
        return "run-openapi-server.sh"
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

            NAME="openapi-server"
            PORT="8888:80"
            while getopts ":n:p:": flag
            do
                case "${flag}" in
                    n) NAME=${OPTARG};;
                    p) PORT=${OPTARG};;
                esac
            done

            # Run the Docker container to serve the OpenAPI files using Nginx
            docker run --rm --name "${NAME}" \
                -v "${OPENAPI_YAML_LOCATION}:/usr/share/nginx/html" \
                -p ${PORT} nginx
            """
    }

}
