#!/bin/zsh

setting_path="${HOME}/.config/zed"
setting_json='settings.json'

mkdir -pv "${setting_path}"
ln -sFv "$(realpath ${setting_json})" "${setting_path}/${setting_json}"
