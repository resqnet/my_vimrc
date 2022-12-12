bindkey -e
eval `ssh-agent`
export LC_ALL=ja_JP.UTF-8
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


# PROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c(%u%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
# PROMPT='%B%F{green}%n:[%B%F{blue}%~%f%b]${vcs_info_msg_0_} %(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵)ﻭ < !(;^ω^%) < )%f%b'
PROMPT='%n:%m:[%~]${vcs_info_msg_0_}%(?!(๑>ᴗ<)ﻭ < !(;^ω^%) < )'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias gitgraph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

function history-all { history -E 1 }


export server_user=xxxxxx
export sakura_url1=xxxxxx
export sakura_url2=xxxxxx
alias sakuravps='ssh -p 2033 -A ${server_user}@${sakura_url1}'
alias sakuravps2='ssh -p 2033 -A ${server_user}@${sakura_url2}'


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true


export aws_id=xxx
export id=xxx
export profile=xxx
function getAWSToken() {
  credentials=`aws sts get-session-token --serial-number arn:aws:iam::${aws_id}:mfa/${id} --profile ${profile} --token-code $1 | jq '.Credentials'`
  export AWS_ACCESS_KEY_ID=`echo $credentials | jq '.AccessKeyId' -r`
  export AWS_SECRET_ACCESS_KEY=`echo $credentials | jq '.SecretAccessKey' -r`
  export AWS_SESSION_TOKEN=`echo $credentials | jq '.SessionToken' -r`
  echo "success [Key:${AWS_SECRET_ACCESS_KEY}]"
}


# 以下環境依存設定なので不要
function SearchDesynth() {
	if expr $1 : "[0-9]*$" >&/dev/null; then
		sudo mysql -D ffxvi -e "select _key, Name, Desynth from Item where Desynth=$1 and Desynth <> 0 ";
	else
		sudo mysql -D ffxvi -e "select d._key, d.Name, d.Desynth, g.cnt from ( select _key, Name, Desynth from Item where Name like '%$1%' and Desynth <> 0 ) d, ( select Desynth, count(Desynth) cnt from Item where Desynth <> 0 group by Desynth ) g where d.Desynth = g.Desynth order by g.cnt asc;"
	fi
}

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
