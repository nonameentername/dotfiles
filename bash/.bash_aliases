export TERM=screen-256color
export CLICOLOR=1
export COLORTERM=truecolor

if [ -f /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
else
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

export IDEA_JDK=$JAVA_HOME
export M2_HOME=$HOME/usr/bin/apache-maven-3.3.9
export GRADLE_HOME=$HOME/usr/bin/gradle-1.8
export ANT_HOME=/usr/share/ant
export LD_LIBRARY_PATH=/home/wmendiza/usr/lib

#android
export ANDROID_SDK=$HOME/source/android-sdk
export ANDROID_NDK=$HOME/source/android-ndk
export ANDROID_NDK_ROOT=$ANDROID_NDK
export ANDROIDTOOLCHAIN=$HOME/source/android-cmake/toolchain/android.toolchain.cmake
export ANDROID_NDK_TOOLCHAIN_ROOT=$HOME/source/android-toolchain

#gba/nds compiler
export DEVKITPRO=/usr/local/include/devkitPro
export DEVKITARM=$DEVKITPRO/devkitARM

#golang
export GOROOT=$HOME/usr/go/
export GOPATH=$HOME/go

export PATH=$GRADLE_HOME/bin:$PATH
export PATH=/usr/local/bin/eclipse:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/source/android-sdk/tools:$PATH
export PATH=$HOME/source/android-ndk:$PATH
export PATH=$HOME/source/android-ndk/build/prebuilt/linux-x86/arm-eabi-4.4.0/bin:$PATH
export PATH=$HOME/source/android-sdk/platform-tools:$PATH
export PATH=$HOME/source/android-toolchain/bin:$PATH
export PATH=$HOME/source/google-cloud-sdk/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH="$HOME/.jenv/bin:$PATH"
export PATH=$PATH:$GOROOT/bin
export PATH=$HOME/.nix-profile/bin:$PATH
export PATH=.:$PATH

fzf_file_preview() {
    if [ -d "$1" ]; then
        tree "$1" -C -L 3
    else
        bat "$1" --style=numbers --color=always --pager=never
    fi
}
export -f fzf_file_preview

fzf_search_file() {
    filename=$(( find * -type f & find * -type d ) 2> /dev/null | fzf --preview 'fzf_file_preview {}')
    if [ -d $filename ]; then
        cd $filename
    elif [ -f $filename ]; then
        cd $(dirname $filename)
        vi $(basename $filename)
    fi
}
export -f fzf_search_file

alias sd="cd \$(find * -type d 2>/dev/null | fzf --preview 'tree {} -C -L 3')"
alias sf="fzf_search_file"
alias wicd-client="wicd-client --no-tray"
alias gdb="gdb -tui"
alias gohome="ssh -p 33323 home"
alias ports="netstat -putlan"
alias tmux="tmux attach || tmux"
alias ls='ls --color=auto'

#bash eternal history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%s "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

#Terminal prompt
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
RED="\[$(tput setaf 5)\]"
RESET="\[$(tput sgr0)\]"
PS1="[werner@\h ${GREEN}\w${YELLOW}\$(parse_git_branch)${BLUE}\$(parse_pyenv_version)${RED}\$(parse_nix_env)${RESET}]\n$ "

export VISUAL=vi
export EDITOR=vi

# to unmap ctrl-s
stty stop undef

#alias sudo="sudo env PATH=$PATH"
alias ltree="tree -C | less -R"

alias json="python -m json.tool"
alias xml="xmllint --format -"
alias html="tidy -i --indent-spaces 4"

alias tmux="TERM=screen-256color-bce tmux"

alias idea="_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel' idea"

alias rng=ranger

#maven alias
alias mcc="mvn clean compile"
alias mcp="mvn clean package"
alias mct="mvn clean test"
alias mjr="mvn jetty:run"
alias mp="mvn package"
alias mt="mvn test"
alias mtr="mvn tomcat:run"

#gradle alias
alias gcb="gradle clean build -x test"
alias gt="gradle test"
alias gjr="gradle jettyRun"
alias gua="gradle uploadArchives"

#docker alias
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcr="docker-compose rm -f"

#git alias
alias gs="git status"

#identity alias

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

if which pipenv > /dev/null; then
    eval "$(pipenv --completion)"
fi

if [ -e '$HOME/.nix-profile/etc/profile.d/nix-daemon.sh' ]; then
    source '$HOME/.nix-profile/etc/profile.d/nix-daemon.sh'
fi

if which direnv > /dev/null; then

    # direnv
    eval "$(direnv hook bash)"
    export DIRENV_LOG_FORMAT=''
fi

if which brew > /dev/null; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        source `brew --prefix`/etc/bash_completion
    fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

if which jenv > /dev/null; then
    eval "$(jenv init -)"
fi

alias vssh='ssh -t vagrant@127.0.0.1 -p 2222 -i $HOME/.vagrant.d/insecure_private_key'

if [[ "$(uname)" = "Darwin" ]]; then
    alias tmux='TERM=screen-256color-bce tmux -f ~/.tmux-osx.conf'
else
    alias tmux='TERM=screen-256color-bce tmux'
fi

source $HOME/.fzf-solarized-dark

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

if [ -f $HOME/.private_aliases ]; then
    source $HOME/.private_aliases
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_pyenv_version() {
    pyenv_version=$(pyenv version-name 2> /dev/null)
    if [[ $pyenv_version != "system" ]]; then
        echo "($pyenv_version)"
    fi
}

parse_nix_env() {
    if [ -n "$name" ]; then
        echo "($(basename $name))"
    fi
}

