#
# ~/.zprofile
#

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

export PATH="$HOME/.cargo/bin:$PATH"

# export ANDROID_HOME=/usr/local/share/android-sdk

# export ANDROID_HOME=/Users/$USER/Library/Android/sdk
# export ANDROID_SDK_HOME=/Users/$USER/Library/Android/sdk
# export ANDROID_AVD_HOME=/Users/$USER/.android/avd
# export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_AVD_HOME
