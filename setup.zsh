#!/bin/bash

set -e
set -x

function setup() {
  local target
  local ret

  target="${1}"
  if [[ ! -d "${target}" ]]; then
    echo "${target}: no such target"
    return 1
  fi

  pushd "${target}" || return 1

  ./setup.zsh
  ret="${?}"

  popd || return 1

  return "${ret}"
}

function check_os() {
  local osinfo

  osinfo="$(uname)"
  if [[ "${osinfo}" == 'Darwin' ]]; then
    echo 'mac'
    return 0
  elif [[ "${osinfo:1:5}" == 'Linux' ]]; then
    echo 'linux'
    return 0
  elif [[ "${osinfo:1:10}" == 'MINGW32_NT' ]]; then
    echo 'cygwin'
    return 0
  else
    echo 'unknown'
    return 1
  fi
}

function is_rust_installed() {
  if [[ -d "${HOME}/.cargo" ]]; then
    return 0
  else
    return 1
  fi
}

function install_rust_utils() {
  local utils
  utils=(
    'ripgrep'
    'fd-find'
    'lsd'
    'sheldon'
  )

  for util in "${utils[@]}"; do
    cargo install "${util}"
  done

  return 0
}

function main() {
  local os
  local input
  local setup_list

  os="$(check_os)"
  if [[ "${os}" != 'mac' ]]; then
    if [[ "${os}" != 'linux' ]]; then
      echo "Your platform (${os}) is not supported in this branch."
      echo "Try run following command."
      echo "git checkout linux && ./setup"
    else
      echo "Your platform (${os}) is not supported."
      return 1
    fi
  fi

  is_rust_installed
  if [[ ! "${?}" ]]; then
    echo "This script uses some utilities written by Rust"
    echo -n "install? (Y/n) "
    read -r -t 15 input
    case "${input}" in
    'Y')
      echo "thanks"
      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
      ;;
    'n' | *)
      return 1
      ;;
    esac
  elif [[ "${PATH}" != "*${HOME}/.cargo/bin*" ]]; then
    echo "not setuped for Rust"
    source "${HOME}/.cargo/env"
  fi

  install_rust_utils

  setup_list=(
    'bin'
    #'zsh'
    #'dgb'
    'nvim'
    'latex'
  )

  for i in "${setup_list[@]}"; do
    setup "${i}" || return 1
  done

  return "${?}"
}

main
exit "${?}"
