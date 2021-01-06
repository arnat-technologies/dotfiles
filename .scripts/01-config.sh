echo ">>> EXPORTING VARIABLES"
export TARGET_HOME='/home/node'
export DOTFILES_DIR="$TARGET_HOME/.user/dotfiles"
export SCRIPTS_DIR="$DOTFILES_DIR/.scripts"
export SILENT_INSTALL=true

# > npm config set cache C:\Devel\nodejs\npm-cache --global 
# npm_config_cache=/path/to/cache
# docker run -e npm_config_cache=/path/to/cache mydockerimage:tag

