#!/usr/bin/env bash

#
# Run all linters from dev Docker container.
#

set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"/..

./scripts/docker-run.sh ./scripts/lint.sh
