#!/bin/sh
echo -ne '\033c\033]0;erasmsus pong\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/erasmsus pong.x86_64" "$@"