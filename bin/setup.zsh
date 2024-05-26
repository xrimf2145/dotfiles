#!/bin/bash

BIN_DIR="${HOME}/.local/bin"
TOOLS_DIR="${PWD}/tools"

function main() {
	mkdir -pv "${BIN_DIR}" || return 1

	files=($(fd . "${TOOLS_DIR}" --type file))
	for file in "${files[@]}"; do
		if [[ -e "${file}" ]]; then
			echo "${BIN_DIR}/${file} is already exits and ignored"
			continue
		else
			file="$(basename "${file}")"
			ln -vs "${TOOLS_DIR}/${file}" "${BIN_DIR}/${file}" || return 1
		fi
	done

	return 0
}

main
exit "${?}"
