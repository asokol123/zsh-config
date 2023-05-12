# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -f ~/.znap/zsh-snap/znap.zsh ]] || git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap
source ~/.znap/zsh-snap/znap.zsh

znap source ohmyzsh/ohmyzsh

znap source ohmyzsh/ohmyzsh plugins/archlinux
znap source ohmyzsh/ohmyzsh plugins/aws
znap source ohmyzsh/ohmyzsh plugins/colored-man-pages
znap source ohmyzsh/ohmyzsh plugins/command-not-found
znap source ohmyzsh/ohmyzsh plugins/common-aliases
znap source ohmyzsh/ohmyzsh plugins/fzf
znap source ohmyzsh/ohmyzsh plugins/sudo
znap source ohmyzsh/ohmyzsh plugins/systemd

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

znap eval direnv 'direnv hook zsh'

znap prompt romkatv/powerlevel10k

export TERM="xterm-256color"
export EDITOR="nvim"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

source $HOME/.zsh_aliases

function cdtmp () {
    name=$(mktemp -d)
    cd $name
}

function layp () {
    if [ ! -f .envrc ]; then
        echo "layout python" > .envrc
        direnv allow
    fi
}

export TMPDIR="$HOME/tmp"

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/alex/yandex-cloud/path.bash.inc' ]; then source '/home/alex/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/alex/yandex-cloud/completion.zsh.inc' ]; then source '/home/alex/yandex-cloud/completion.zsh.inc'; fi

[ -f "/home/alex/.ghcup/env" ] && source "/home/alex/.ghcup/env" # ghcup-env

export PATH="$PATH:/home/alex/.foundry/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
