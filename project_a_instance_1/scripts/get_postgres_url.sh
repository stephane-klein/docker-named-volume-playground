#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

source ./scripts/load_postgres_variables.sh

echo postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:${POSTGRES_PORT}/${POSTGRES_DB}
