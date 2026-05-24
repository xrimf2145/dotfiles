#!/bin/zsh

setting_path="${HOME}/.config/ghostty"
setting_json='config'

mkdir -pv "${setting_path}"
ln -sFv "$(realpath ${setting_json})" "${setting_path}/${setting_json}"
