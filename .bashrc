# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# autocd
shopt -s autocd

# alias
alias ls='ls --color=auto'
alias neofetch='neofetch --ascii_colors 4 --colors 4 --ascii_distro redhat'