#!/usr/bin/env bash

#set -eo pipefail

echo "1) Start"

false
echo "2) After false (should NOT run if -e works)"

false | true
echo "3) After pipeline (pipefail matters here)"

echo "4) End"