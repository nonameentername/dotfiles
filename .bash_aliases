#gba/nds compiler
export SDK_ROOT=/usr/local/include/android
export DEVKITPRO=/usr/local/include/devkitPro
export DEVKITARM=$DEVKITPRO/devkitARM

export PATH=/usr/local/bin/eclipse:$PATH
export PATH=$SDK_ROOT/tools:$DEVKITARM/bin:$PATH
export PATH=/usr/local/share/android-sdk/tools:$PATH
export PATH=$PATH:.

#Terminal prompt
PS1="[\u@\h:\#]$ "

#Copy clipboard
alias xsel="xsel --clipboard"
