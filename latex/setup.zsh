#!/bin/bash

set -e

if [[ -e "${PWD}/.latexmkrc" ]]; then
	echo "${PWD}/.latexmkrc is already exits and ignored"
	exit 1
else
	ln -vs "${PWD}/latexmkrc" "${PWD}/.latexmkrc" || exit 1
fi

exit 0
