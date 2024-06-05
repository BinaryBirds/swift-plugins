#!/usr/bin/env bash
set -euo pipefail

log() { printf -- "** %s\n" "$*" >&2; }
error() { printf -- "** ERROR: %s\n" "$*" >&2; }
fatal() { error "$@"; exit 1; }

CURRENT_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(git -C "${CURRENT_SCRIPT_DIR}" rev-parse --show-toplevel)"

OPENAPI_YAML_LOCATION="${REPO_ROOT}/openapi";

docker run --rm --name "lms-openapi-security-check" \
    -v "${OPENAPI_YAML_LOCATION}:/app" \
    -t owasp/zap2docker-weekly zap-api-scan.py \
    -t /app/openapi.yaml -f openapi
