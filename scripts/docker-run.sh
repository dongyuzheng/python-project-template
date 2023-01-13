#!/usr/bin/env bash

#
# Run something inside the dev Docker container.
#
# * The default is to attach to `bash`, but you can pass other commands.
# * The root of this repo will be mounted to `/code`.
# * The container is removed after you exit, so don't try to save work outside of `/code`.
#
# Usage: ./docker-run.sh [CMD]
#

set -euxo pipefail

readonly SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"/..

CMD="$@"
if [ -z "$CMD" ]; then
    CMD='/bin/bash'
fi

docker compose run --rm -it --workdir /code/ devserver $CMD
