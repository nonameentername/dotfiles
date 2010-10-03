export JAVA_HOME=/usr/lib/jvm/java-6-sun
export IDEA_JDK=$JAVA_HOME
export M2_HOME=/usr/share/maven2
export ANT_HOME=/usr/share/ant

#gba/nds compiler
export SDK_ROOT=/usr/local/include/android
export DEVKITPRO=/usr/local/include/devkitPro
export DEVKITARM=$DEVKITPRO/devkitARM

export PATH=/usr/local/bin/eclipse:$PATH
export PATH=$SDK_ROOT/tools:$DEVKITARM/bin:$PATH
export PATH=/usr/local/share/android-sdk/tools:$PATH
export PATH=$HOME/usr/bin:$PATH
export PATH=$PATH:.

#Terminal prompt
PS1="[\u@\h:\#]$ "

#Copy clipboard
alias xsel="xsel --clipboard"
