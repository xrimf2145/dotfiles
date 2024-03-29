function clever_change_directory() {
	if [ -n "$1" ]; then
		cd $(fd -LH . -t d $1 2>/dev/null | fzf -m --preview "tree -C {}")
	else
		cd $(fd -LH . -t d --exclude .cache $HOME/ 2>/dev/null | fzf -m --preview "tree -C {}")
	fi
}
zle -N clever_change_directory
alias cdd='clever_change_directory'

function exec_neovim_with_fzf() {
	if [ -n "$1" ]; then
		nvim $(fd -LH . -t f --exclude '*.o' --exclude '*.bin' --exclude '*.d' $1 2>/dev/null | fzf -m --preview "bat -p --color=always {}")
	else
		nvim $(fd -LH . -t f --exclude '*.o' --exclude '*.bin' --exclude '*.d' $(pwd)/ 2>/dev/null | fzf -m --preview "bat -p --color=always {}")
	fi
}
zle -N exec_neovim_with_fzf
alias fvim='exec_neovim_with_fzf'

function exec_neovim_greping_string() {
	if [ -n "$2" ]; then
		nvim $(grep -rl --exclude-dir .cache --exclude '*.bin' --exclude '*.d' --exclude '*.o' "$1" "$2" | fzf -m --preview "grep --color=always -z $1 {}")
	else
		nvim $(grep -rl --exclude-dir .cache --exclude '*.bin' --exclude '*.d' --exclude '*.o' "$1" $(pwd)/ | fzf -m --preview "grep --color=always -z $1 {}")
	fi
}
zle -N exec_neovim_greping_string
alias svim='exec_neovim_greping_string'

function exec_neovim_string() {
	if [ -n "$2" ]; then
		nvim $(grep -rl --exclude-dir .cache -x "$1" "$2" | fzf -m --preview "grep --color=always -z $1 {}")
	else
		nvim $(grep -rl --exclude-dir .cache -x "$1" $(pwd)/ | fzf -m --preview "grep --color=always -z $1 {}")
	fi
}
zle -N exec_neovim_string
alias xvim='exec_neovim_greping_string'

function open_file_with_fzf() {
	if [ -n "$1" ]; then
		open $(find "$1" -type f 2>/dev/null | fzf -m --preview "bat {}")
	else
		open $(find $(pwd)/ -type f 2>/dev/null | fzf -m --preview "bat {}")
	fi
}
zle -N open_file_with_fzf
alias fopen='open_file_with_fzf'

function serch-history() {
#	BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
#	CURSOR=$#BUFFER
	exec $(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
}
zle -N serch-history
alias serch-history='serch-history'

function attach_gdb_from_pid() {
	while getopts e OPT
	do
		case $OPT in
			e) gdb -q -ex init-peda -p $(ps -A | fzf | awk '{print $1}');;
			*) peda -p $(ps -A | fzf | awk '{print $1}');;
		esac
	done
	peda -p $(ps -A | fzf | awk '{print $1}')
#	peda -p $(ps -A | fzf | awk '{print $1}')
}
zle -N attach_gdb_from_pid
alias fgdb='attach_gdb_from_pid'

function convert_png_to_eps() {
	convert $1.png -background white -flatten -alpha off eps2:$1.eps
}
zle -N convert_png_to_eps
alias eps='convert_png_to_eps'

function convert_jpeg_to_eps() {
	convert $1.jpeg -background white -flatten -alpha off eps2:$1.eps
}
zle -N convert_jpeg_to_eps
alias eps='convert_jpeg_to_eps'

function shellcode_generator() {
	objdump -M intel -d $1 | grep '^ ' | cut -f2 | perl -pe 's/(\w{2})\s+/\\x\1/g'
}
zle -N shellcode_generator
alias shellgen='shellcode_generator'

function cd_git_repository() {
	cd $(ghq root)/$(ghq list | fzf -m --preview "mdv $(ghq root)/{}/README.md")
}
zle -N cd_git_repository
alias ghcd='cd_git_repository'

function update_git_repository() {
	ghq get --update $(ghq list | fzf -m --preview "mdv $(ghq root)/{}/README.md")
}
zle -N update_git_repository
alias ghpull='update_git_repository'

function colored() {
	command env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		PAGER="${commands[less]:-$PAGER}" \
		_NROFF_U=1 \
		PATH="$HOME/bin:$PATH" \
			"$@"
}

function man() {
	colored man "$@"
}
