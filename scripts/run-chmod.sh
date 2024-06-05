#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git -C "$PWD" rev-parse --show-toplevel)"
chmod -R oug+x "${REPO_ROOT}/scripts/"
