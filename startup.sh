#!/bin/bash

SESSION="home"

# tmux内にいない場合は警告
if [ -z "$TMUX" ]; then
    echo "tmuxセッション内で実行してください。"
    exit 1
fi

# 新しいウィンドウを作成
tmux new-window -n "terraform-win"

# 最初のペイン
tmux send-keys "cd ~/projects/terraform-oreilly" C-m

# 横分割して2つ目のペイン
tmux split-window -h
tmux send-keys "cd ~/projects/terraform-oreilly" C-m
