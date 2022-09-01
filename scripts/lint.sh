#!/usr/bin/env bash

#
# Run all linters from your current environment.
#

set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"/..

export PYTHONPATH="$(pwd):${PYTHONPATH-}"

poetry run isort .

poetry run black .

poetry run pytest -vv

poetry run mypy .

poetry run bandit -c 'pyproject.toml' -r .

poetry run pylint $(find . -type f -name '*.py' -printf '%p ')
