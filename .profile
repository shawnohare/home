# ----------------------------------------------------------------------------
# ~/.profile is xecuted by the command interpreter for login shells.
# Historically, processing heavy setup is performed here, while transient
# settings that are not inherited are put in rc files so they can be re-read by
# every new interactive shell invocation.
#
# This can contain environmental variables, PATH, and some plugin init scripts
# (e.g., pyenv and nix).  It should be sourced by the shell's corresponding
# file if it exists, (e.g., .bash_profile, .zprofile).
#
# from the shell specific rc file (e.g., .bashrc, .zshrc)
#
# We treat this file as a library of common profile init functions instead
# that can be called from other locations.
# ----------------------------------------------------------------------------

function set_vars() {
    # Init
    export TESTVAR=1
    export TMPDIR="${TMPDIR:-/tmp}"
    export TERMINAL="alacritty"

    # XDG Base Directory Specification
    # Most applications that utlize XDG respect these variables, but some
    # still utilize hard-coded values or do not have access to the user env
    # (e.g., some graphical applications).
    export CONFIG_HOME="${HOME}/conf"
    export LOCAL_HOME="${HOME}/.local"
    export BIN_HOME="${HOME}/bin"
    export DATA_HOME="${HOME}/share"
    export OPT_HOME="${HOME}/opt"
    export SRC_HOME="${HOME}/src"
    export TMP_HOME="${HOME}/tmp"

    export XDG_BIN_HOME="${LOCAL_HOME}/bin"
    export XDG_CACHE_HOME="${HOME}/.cache"
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_DATA_HOME="${LOCAL_HOME}/share"
    export XDG_STATE_HOME="${LOCAL_HOME}/state"
    export XDG_LIB_HOME="${LOCAL_HOME}/lib"
    export XDG_OPT_HOME="${OPT_HOME}"
    export XDG_RUNTIME_DIR="$TMPDIR"
    export XDG_SRC_HOME="${LOCAL_HOME}/src"
    export XDG_VAR_HOME="${LOCAL_HOME}/var"

    # Misc vars forcing apps to adhere to the XDG Base Directory Specification.
    # NOTE: Some apps, like ansible, appear to not respect AWS vars.
    # export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
    # export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"
    # export CARGO_INSTALL_ROOT="${XDG_BIN_HOME}"
    # export GOBIN="${XDG_BIN_HOME}"
    # export PYTHONUSERBASE="${XDG_OPT_HOME}"
    # export SPARK_HOME="/opt/spark"
    export CARGO_HOME="${OPT_HOME}/cargo"
    export MAMBA_ROOT_PREFIX="${OPT_HOME}/mamba"
    export CONDA_ROOT="${MAMBA_ROOT_PREFIX}"
    export CONDA_ENVS_PATH="${XDG_STATE_HOME}/mamba/envs"
    export CONDA_PKGS_DIRS="${XDG_STATE_HOME}/mamba/pkgs"
    # NOTE: conda will load $CONDARC, but wants to write to ~/.condarc
    # export CONDARC="${XDG_CONFIG_HOME}/conda/conda.yml"
    # Set location used to install optional packages via conda. Added to path.
    export CONDA_OPT_HOME="${CONDA_ENVS_PATH}/opt"

    export DOOMDIR="${XDG_CONFIG_HOME}/doom"
    export GOPATH="${OPT_HOME}/go"
    export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
    export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
    # export LESS=-XNMr
    export LESS=-Mr
    export LISTLINKS=1
    export NIXPKGS_CONFIG="${XDG_CONFIG_HOME}/nixpkgs/config.nix"
    export PIPX_HOME="${OPT_HOME}/pipx"
    export POETRY_HOME="${OPT_HOME}/pypoetry"
    export POETRY_VIRTUALENVS_PATH="${XDG_STATE_HOME}/pypoetry/envs"
    export PYENV_ROOT="${OPT_HOME}/pyenv"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    export PYENV="${OPT_HOME}/pyenv/bin/pyenv"
    export PYSPARK_DRIVER_PYTHON="ipython"
    export RUSTUP_HOME="${OPT_HOME}/rustup" # Might be superfluous.
    export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"
    export SPACEMACSDIR="${XDG_CONFIG_HOME}/spacemacs"
    export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
    export SQITCH_USER_CONFIG="${XDG_CONFIG_HOME}/sqitch/config"
    export STACK_ROOT="${OPT_HOME}/stack"
    export STASH_TARGET="${HOME}"
    export TMUX_PLUGIN_MANAGER_PATH="${XDG_STATE_HOME}/tmux/plugins/"
    export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat


    # ----------------------------------------------------------------------------
    # Vim
    # ----------------------------------------------------------------------------
    # Let vim/neovim use same init file. NOTE: This could make things more
    # complicated. We primarily use neovim.
    # export MYVIMRC="${XDG_CONFIG_HOME}/vim/init.vim"
    # export VIMINIT="source ${MYVIMRC}"

    # ----------------------------------------------------------------------------
    # Misc App Settings
    # ----------------------------------------------------------------------------
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_BOOTSNAP=1

    # ----------------------------------------------------------------------------
    # Unix tools
    # ----------------------------------------------------------------------------
    # Setting the BROWSER env var can break fish's help command.
    # export BROWSER="safari"
    export PAGER="less"
    # export PAGER="nvim --clean +Man!"
    export MANPAGER="nvim --clean +Man!"
    # export MANPAGER="less"
    export MANCOLOR=1
    export EDITOR="nvim"
    export VISUAL="nvim"
    export CLICOLOR=1

    # Unclear if we need to set these as man should automatically look in share
    # export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man:$MANPATH
    # export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info:$INFOPATH

    # All of these settings enable consistent coloring of the most frequently
    # used parts of the CLI. For historical reasons 'ls', 'less', 'grep', and
    # the completion menu all require separate color settings.

    # Enable command line color
    # Default linux-like colors.
    export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
    # Solarized:
    # export LSCOLORS='ExfxcxdxbxGxDxabagacad'
    # Define colors for the zsh completion system
    # export LS_COLORS='di=01;34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

    # Solarized colors
    # NOTE: This can be autogenerated from a file via dircolors.
    # The below is generated from dircolors $XDG_CONFIG_HOME/dircolors/solarized-ansi-dark
    # export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.hpp=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.cl=32:*.sh=32:*.bash=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.sql=32:*.csv=32:*.sv=32:*.svh=32:*.v=32:*.vh=32:*.vhd=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.opus=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.odt=31:*.dot=31:*.dotx=31:*.ott=31:*.xls=31:*.xlsx=31:*.ods=31:*.ots=31:*.ppt=31:*.pptx=31:*.odp=31:*.otp=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:';

    # The pager 'less' (the default pager for man-pages) depends on
    # the terminfo termcap interface for color capabilities. Exporting
    # the following parameters provides for colored man-page display.
    LESS_TERMCAP_mb=$(printf "\\033[01;31m")    # begins blinking = LIGHT_RED
    LESS_TERMCAP_md=$(printf "\\033[00;34m")    # begins bold = BLUE
    LESS_TERMCAP_me=$(printf "\\033[0m")        # ends mode = NO_COLOR
    LESS_TERMCAP_so=$(printf "\\033[00;47;30m") # begins standout-mode = REVERSE_WHITE
    LESS_TERMCAP_se=$(printf "\\033[0m")        # ends standout-mode = NO_COLOR
    LESS_TERMCAP_us=$(printf "\\033[00;32m")    # begins underline = LIGHT_GREEN
    LESS_TERMCAP_ue=$(printf "\\033[0m")        # ends underline = NO_COLOR
    export LESS_TERMCAP_mb
    export LESS_TERMCAP_md
    export LESS_TERMCAP_me
    export LESS_TERMCAP_so
    export LESS_TERMCAP_se
    export LESS_TERMCAP_us
    export LESS_TERMCAP_ue

    # zsh. Can also set in .zshenv but we'd like other shells to still know
    # where to look for zsh files, potentially.
    export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
    export ZSH_PKG_HOME="${XDG_DATA_HOME}/zsh/pack"

    # The following provide color highlighing by default for GREP
    # export GREP_COLOR='37;45'
    # NOTE: GREP_OPTIONS is deprecated.
    # export GREP_OPTIONS='--color=auto'
    export ENV_SET=1
}

function set_aliases() {
    # case "${OSTYPE}" in
    #     linux*)
    #         alias ls="ls --color -GF"
    #         ;;
    #     **)
    #         if [ $(command -v gls) 1> /dev/null ]; then
    #             alias ls="gls --color -GF"
    #         else
    #             alias ls="ls -GF"
    #         fi
    #         ;;
    # esac

    # alias la="ls -GFlashi"
    # alias ll="ls -GFlshi"
    # alias ..="cd .."
    # alias ...="cd ../.."
    # alias ....="cd ../../.."
    # alias .....="cd ../../../.."
    # alias emc="emacsclient"
    # alias code="code-insiders"
    # alias oni="oni2"
    # alias usevenv="mamba activate"
    # alias ce="GIT_DIR=$HOME/.git GIT_WORK_TREE=$HOME nvim"
}

function set_path() {
    local usr="/usr/local/bin:/usr/local/sbin:/usr/local/opt/bin:/opt/bin"
    local lang="${CARGO_HOME}/bin:${GOPATH}/bin:${PATH}"
    local local="${HOME}/bin:${XDG_BIN_HOME}"
    # append to path so nix profile comes first
    PATH="${PATH}:${local}:${lang}:${usr}"
    # TODO: Rely on shell hooks for mamba.
    # PATH="${MAMBA_ROOT_PREFIX}/bin:${PYENV_ROOT}/bin:${PATH}"
    # PATH="${CONDA_OPT_HOME}/bin:${CONDA_ROOT}/condabin:${PYENV_ROOT}/bin:${PATH}"
    # TODO: Can probably delete this and use the daemon.
    export PATH
}

# ----------------------------------------------------------------------------
# Linuxbrew
# On linux systems with Linuxbrew installed, augment path and set env.
# Linuxbrew is used primarily to get newer versions of software.
# if [ -d ~/.linuxbrew ]; then
#     eval $(~/.linuxbrew/bin/brew shellenv)
# elif [ -d /home/linuxbrew ]; then
#     eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# fi

# NOTE: Many programs that require some form of init need to go in their
# respective RC files, as many of the effects will not carry over to
# interactive, non-login shells (such as wrapper function definitions).
