#!/bin/sh
printf '\033c\033]0;%s\a' gmtk gamejam
base_path="$(dirname "$(realpath "$0")")"
"$base_path/gmtk-gamejam.x86_64" "$@"
