export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

## 色の設定
autoload -Uz colors
colors

## 補完
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## gitのブランチ名を常に表示する対応
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b)' # 通常のフォーマット
zstyle ':vcs_info:git:*' actionformats '(%b|%a)' # rebaseなどの実行中のフォーマット

PROMPT="%F{cyan}($(arch))%f %F{blue}%~%f %F{green}${vcs_info_msg_0_}%f %# "

eval "$(direnv hook zsh)"

# VS Codeのターミナル起動時に自動でtmuxにアタッチ
if [ -z "$TMUX" ] && [ "$TERM_PROGRAM" = "vscode" ]; then
    tmux attach 2>/dev/null || tmux new-session
fi

## 設定が反映されない場合はこのコマンド忘れかも source ~/.zshrc
