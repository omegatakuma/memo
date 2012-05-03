export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export GISTY_DIR="$HOME/dev/gists"
export PATH=$PATH:~/.gem/ruby/1.8/bin/ 
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
# Emacs style key binding
bindkey -e

# エスケープシーケンスを使う。
setopt prompt_subst

if [ $USER = "root" ] 
then
    PROMPT="%{[$[31]m%}%B$LOGNAME@%m[%W %T]:%b%{[m%} %h# "
    RPROMPT="[%{[31m%}%~%{[m%}]"
    PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin
    HOME=/root
else
#    PROMPT="%{[33m%}$LOGNAME@%m%B[%W %T]:%b%{[m%} %h%% "
    PROMPT="%{[$[32+$RANDOM % 5]m%}$LOGNAME@%m%B[%W %T]:%b%{[m%} %h%% "
    RPROMPT="[%{[33m%}%~%{[m%}]"
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

function history-all { history -E 1 } # 全履歴の一覧を出力する

# プロンプトのカラー表示を有効
autoload -U colors
colors

# デフォルトの補完機能を有効
autoload -U compinit
compinit

# 補完侯補をEmacsのキーバインドで動き回る
zstyle ':completion:*:default' menu select=1

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

###
# Set shell options
###
#setopt auto_menu auto_cd correct auto_name_dirs auto_remove_slash
#setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
#setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
#setopt extended_glob list_types no_beep always_last_prompt
#setopt cdable_vars sh_word_split auto_param_keys

# C-s, C-qを無効にする。
setopt no_flow_control

# 先頭がスペースならヒストリーに追加しない。
setopt hist_ignore_space

# リダイレクトで上書きする事を許可しない。
setopt no_clobber

# ベルを鳴らさない。
setopt no_beep

# ^Dでログアウトしないようにする。
setopt ignore_eof

# ^Iで補完可能な一覧を表示する。(曖昧補完)
setopt auto_list

# cdでpushdする。
setopt auto_pushd

# pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups

# globを拡張する。
setopt extended_glob

# 補完時にスペルチェックをする。
#setopt auto_correct

# リターンを押す度にスペルチェックをする。
#setopt correct
#setopt correct_all

# 補完時にヒストリを自動的に展開する。
setopt hist_expand

# pushd を引数無しで実行した時に pushd ~ とする。
setopt pushd_to_home

# ディレクトリ名だけで移動できる。
setopt auto_cd

# rm * を実行する前に確認される。
#setopt rmstar_wait

# カレントディレクトリ中にサブディレクトリが
# 見付からなかった場合に cd が検索する
# ディレクトリのリスト
cdpath=($HOME)

# ログインとログアウトを監視する。
#watch=(all all)
# 全部監視
watch="all"
# 10分おき(デフォルトは1分おき)
#LOGCHECK="$[10 * 60]"
# 取りあえず表示してみる
log

# 10分後に自動的にログアウトする。
#setopt autologout=10

# 10分おきにメールをチェックする。
#setopt mail 600 /var/spool/mail/$USER
#setopt mail 600 $MAIL
# メールをチェックする。
#setopt mail $MAIL

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 履歴ファイルに時刻を記録
setopt extended_history

# 履歴をインクリメンタルに追加
setopt inc_append_history

# 履歴の共有
setopt share_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# coreのサイズ
limit coredumpsize 0

### set alias
alias rr="rm -rf"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ll="ls -l"
alias l="ls"
alias la="ls -a"
alias lla="ls -la"
alias vi="mvim"
alias v="vim"
alias c="clear"
alias hs="ghci"
alias e="open -n /Applications/Emacs.app"
alias g="rlwrap gosh"
alias q="exit"
#alias t="~/gauche/tw/t.scm"
# alias task="~/SchemeToDo/task.scm"
alias count="~/Count/count.scm"
alias img="~/gauche/img/img.scm"
alias pd="pushd"
alias po="popd"
#alias cd="cd \!*; dirs"
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'

alias la="ls -lhAF --color=auto"
alias cl="make -f ~/Makefile clean"
alias ps="ps -fU`whoami` --forest"

#alias a2ps="a2psj"
#alias xdvi="xdvi-ja"
#alias xdvi="ssh -X -f paddy \xdvi"
if [ `uname` = "FreeBSD" ]
then
    alias xdvi="\xdvi -page a4 -s 0"
fi
#alias gs="gs-ja"
alias jman="LANG=ja_JP.EUC \jman"

alias mo="mozilla &"
alias e="emacs &"
alias enw="emacs -nw"

alias a="./a.out"
alias x="exit"

alias -g L='| lv -c'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
#alias -g W='| wc'
alias -g S='| sed'
#alias -g A='| awk'


alias rd2ewb="rd2 -r rd/rd2ewb-lib"
#alias rd2ewb "rd2 -r rd2ewb-lib"
alias dpkg="env COLUMNS=130 \dpkg"

alias mutt="env EDITOR=vim \mutt"

alias sudo="env PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin \sudo"

#alias sodipodi="env GTK_IM_MODULE=im-ja \sodipodi"

alias tgif="\tgif -dbim xim"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

autoload -U compinit
compinit
