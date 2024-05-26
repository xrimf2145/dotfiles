#!/bin/bash

PACKER_PATH="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
PACKER_URL='https://github.com/wbthomason/packer.nvim'

NVIM_CONFIG_DIR="${HOME}/.config/nvim"

function link_config() {
  local target
  local source

  source="${1}"
  target="${2}"

  if [[ -e "${target}" ]]; then
    echo "${target} already exists and ignored"
  else
    ln -ivs "${source}" "${target}"
  fi
}

if [[ ! -e "${PACKER_PATH}" ]]; then
  git clone --depth 1 "${PACKER_URL}" "${PACKER_PATH}"
fi

mkdir -pv "${NVIM_CONFIG_DIR}"

link_config "${PWD}/init.lua" "${NVIM_CONFIG_DIR}/init.lua"
link_config "${PWD}/lua" "${NVIM_CONFIG_DIR}/lua"

exit 0
