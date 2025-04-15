# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/hiteshrawat/completions:"* ]]; then export FPATH="/Users/hiteshrawat/completions:$FPATH"; fi
export PATH=/opt/homebrew/bin:$PATH
# FNM -- alternate node version manager
eval "$(fnm env --use-on-cd)"
# fzf
source <(fzf --zsh)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export LC_ALL=en_US.UTF-8
export PATH=$(go env GOPATH)/bin:$PATH
export PATH=/Users/hiteshrawat/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

prompt_context() {
#  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#  fi
}

npmrf () {
  if [ -e package.json ]; then
    local script
    script=$(cat package.json | jq -r '.scripts | keys[] ' | sort | fzf)
    # print "running yarn $script"
    yarn run $script
  else
    echo "There's no package.json"
  fi
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

 alias pn="pnpm"
 alias pixel5="emulator -avd Pixel_5_API_34"
 alias lvim="NVIM_APPNAME=\"kickstart.nvim.bak\" nvim"
 alias cnvim="NVIM_APPNAME=\"cnvim\" nvim"
 # alias f='cd $(fd --type directory | fzf)'
 alias c="open $1 -a \"Visual Studio Code\""

 source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
. "/Users/hiteshrawat/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

# bun completions
[ -s "/Users/hiteshrawat/.bun/_bun" ] && source "/Users/hiteshrawat/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
