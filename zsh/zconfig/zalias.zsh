# alias
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias l='ls -a --color=auto'
alias so='source'
alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vc='nvim ~/.config/regolith/i3/config'
alias c='clear'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='cd ./../'
alias vim='nvim'
alias open='xdg-open'
alias gdb='gdb -q'
alias q='exit'
alias pip2-upgrade-all="pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip2 install -U --user"
alias pip3-upgrade-all="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U --user"
alias x='chmod +x'
alias python='python3.8'
alias tar-compress-tgz='tar -cvzf'
alias tar-extract-tgz='tar -xvzf'
alias tar-compress-gz='tar -zcvf'
alias tar-extract-gz='tar -zxvf'
alias tar-compress-bz2='tar -jcvf'
alias tar-extract-bz2='tar -jxvf'
alias tar-compress-xz='tar -Jcvf'
alias tar-extract-xz='tar -Jxvf'
alias tar-compress-tar='tar -cvf'
alias tar-extract-tar='tar -xvf'

# global
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'
alias -g F='| fzf'
# global

# with fzf

function clever_change_directory() {
	if [ -n "$1" ]; then
		cd $(find "$1" -type d 2>/dev/null | fzf -m --preview "tree -C {}")
	else
		cd $(find ~/ -type d 2>/dev/null | fzf -m --preview "tree -C {}")
	fi
}
zle -N clever_change_directory
alias cdd='clever_change_directory'

function exec_neovim_with_fzf() {
	if [ -n "$1" ]; then
		nvim $(find "$1" -type f 2>/dev/null | fzf -m --preview "bat -p --color=always {}")
	else
		nvim $(find ~/ -type f 2>/dev/null | fzf -m --preview "bat -p --color=always {}")
	fi
}
zle -N exec_neovim_with_fzf
alias fvim='exec_neovim_with_fzf'

function open_file_with_fzf() {
	if [ -n "$1" ]; then
		open $(find "$1" -type f 2>/dev/null | fzf -m --preview "file {}")
	else
		open $(find ~/ -type f 2>/dev/null | fzf -m --preview "file {}")
	fi
}
zle -N open_file_with_fzf
alias fopen='open_file_with_fzf'

#function select-history() {
#  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
#  CURSOR=$#BUFFER
#}
#zle -N select-history
#alias sh='select-history'
# with fzf

function shellcode_generator() {
	objdump -M intel -d $1 | grep '^ ' | cut -f2 | perl -pe 's/(\w{2})\s+/\\x\1/g'
}
zle -N shellcode_generator
alias shellgen='shellcode_generator'

function find_gadget_32() {
	rp32 --file="$1" --rop=3 --unique
}
zle -N find_gadget_32
alias rp-32='find_gadget_32'

function find_gadget_64() {
	rp64 --file="$1" --rop=3 --unique
}
zle -N find_gadget_64
alias rp-64='find_gadget_64'
# alias
