export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk/
export IDEA_JDK=$JAVA_HOME
#export M2_HOME=/usr/share/maven2
export M2_HOME=$HOME/usr/bin/apache-maven
export ANT_HOME=/usr/share/ant

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
export GOROOT=$HOME/source/go/

export PATH=/usr/local/bin/eclipse:$PATH
export PATH=$HOME/source/android-sdk/tools:$PATH
export PATH=$HOME/source/android-ndk/:$PATH
export PATH=$HOME/source/android-ndk/build/prebuilt/linux-x86/arm-eabi-4.4.0/bin:$PATH
export PATH=$HOME/source/android-sdk/platform-tools:$PATH
export PATH=$HOME/source/android-toolchain/bin:$PATH
export PATH=$HOME/usr/bin:$PATH
export PATH=$PATH:$GOROOT/bin
export PATH=.:$PATH

export PYTHONSTARTUP=$HOME/.pythonrc
export PYTHONPATH=$HOME/usr/lib/python2.6/site-packages

alias wicd-client="wicd-client --no-tray"
alias gdb="gdb -tui"
alias gohome="ssh -p 33323 home"

#bash eternal history
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER \
               "$(history 1)" >> ~/.bash_eternal_history'

export HISTSIZE=2147483647

#Terminal prompt
PS1="[\u@\h:\#]$ "

export VISUAL=vi
export EDITOR=vi

#alias sudo='sudo env PATH=$PATH'
alias ltree="tree -C | less -R"

alias format_json="python -m json.tool"
alias format_xml="xmllint --format -"
