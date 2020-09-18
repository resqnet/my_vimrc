export LANG=ja_JP.UTF-8
autoload -Uz vcs_info
setopt prompt_subst
setopt share_history
setopt nonomatch
autoload -U compinit
compinit

alias vi='vim'

export CVS_RSH=ssh

#
# 履歴
#
HISTFILE=~/.zsh_history

# メモリ上に保存される件数（検索できる件数）
HISTSIZE=100000

# ファイルに保存される件数
SAVEHIST=100000

# rootは履歴を残さないようにする
if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

# 履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


## git
if [ -f ~/.git-completion.zsh ]; then
    source ~/.git-completion.zsh
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# プロンプトに各種情報を表示
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
# GIT_PS1_SHOWUNTRACKEDFILES=
# GIT_PS1_SHOWSTASHSTATE=1


PROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c(%u%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PROMPT='%B%F{green}%n@%m%f%b:[%B%F{blue}%~%f%b]${vcs_info_msg_0_} %(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵)ﻭ < !(;^ω^%) < )%f%b'


alias grep="grep --color=auto "
alias ar="sudo apachectl restart "
alias gitgraph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias tmux='LD_LIBRARY_PATH=${HOME}/tmux-2.1/libevent-2.0.22-stable/build/lib ${HOME}/tmux-2.1/build/bin/tmux'

function history-all { history -E 1 }

agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo "no ssh-agent"
fi

alias ll="ls -al"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export PATH="/Users/{user}/.rbenv/shims:$PATH"
echo 'eval "$(rbenv init -)"'

alias desc='ruby tools/desc.rb'
alias sakuravps='ssh -p 2033 -A {server_user}@tk2-243-31386.vs.sakura.ne.jp'
alias sakuravps2='ssh -p 2033 -A {server_user}@tk2-240-29966.vs.sakura.ne.jp'

export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/{user}/.ndenv/versions/v10.16.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/{user}/.ndenv/versions/v10.16.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/{user}/.ndenv/versions/v10.16.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/{user}/.ndenv/versions/v10.16.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/{user}/.ndenv/versions/v10.16.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/{user}/.ndenv/versions/v10.16.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsheval "$(plenv init -)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

function getDev2Token() {
  credentials=`aws sts get-session-token --serial-number arn:aws:iam::{aws_id}:mfa/{id} --profile {profile} --token-code $1 | jq '.Credentials'`
  export AWS_ACCESS_KEY_ID=`echo $credentials | jq '.AccessKeyId' -r`
  export AWS_SECRET_ACCESS_KEY=`echo $credentials | jq '.SecretAccessKey' -r`
  export AWS_SESSION_TOKEN=`echo $credentials | jq '.SessionToken' -r`
  echo "success [Key:${AWS_SECRET_ACCESS_KEY}]"
}

alias ngrok="~/bin/ngrok"

export GOPATH=$HOME/.go
export GOROOT="/usr/local/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

eval "$(direnv hook zsh)"
export EDITOR=$(which vim)
