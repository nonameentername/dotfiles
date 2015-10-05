if [ -f /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
else
    export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
fi

export IDEA_JDK=$JAVA_HOME
export M2_HOME=$HOME/usr/bin/apache-maven-3.1.1
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
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/source/android-sdk/tools:$PATH
export PATH=$HOME/source/android-ndk/:$PATH
export PATH=$HOME/source/android-ndk/build/prebuilt/linux-x86/arm-eabi-4.4.0/bin:$PATH
export PATH=$HOME/source/android-sdk/platform-tools:$PATH
export PATH=$HOME/source/android-toolchain/bin:$PATH
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
PS1="[\u@\h:\#]$ "

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
alias ls="ls -F"
alias fig=docker-compose

export DOCKER_HOST=tcp://localhost:4243

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
