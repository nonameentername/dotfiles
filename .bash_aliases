export TERM=screen-256color-bce

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
export PATH=$HOME/usr/bin:$PATH
export PATH=$PATH:$GOROOT/bin
export PATH=.:$PATH

alias wicd-client="wicd-client --no-tray"
alias gdb="gdb -tui"
alias gohome="ssh -p 33323 home"
alias ports="netstat -putlan"
alias tmux="tmux attach || tmux"

#bash eternal history
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND}"'echo $$ $USER \
               "$(history 1)" >> ~/.bash_eternal_history'

export HISTSIZE=2147483647

#Terminal prompt
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
PS1="[\u@\h:\#${GREEN}\w${RESET}]$ "

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


if which brew > /dev/null; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

alias vssh='ssh -t vagrant@127.0.0.1 -p 2222 -i $HOME/.vagrant.d/insecure_private_key'

if [[ "$(uname)" = "Darwin" ]]; then
    alias tmux='TERM=screen-256color-bce tmux -f ~/.tmux-osx.conf'
else
    alias tmux='tmux'
fi

if [ -f $HOME/.private_aliases ]; then
    source $HOME/.private_aliases
fi

if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1

    if [[ "$(uname)" = "Darwin" ]]; then
        source /usr/share/powerline/bindings/bash/powerline.sh
    else
        source /usr/share/powerline/bindings/bash/powerline.sh
    fi
fi
