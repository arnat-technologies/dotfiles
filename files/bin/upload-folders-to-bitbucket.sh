#! /bin/zsh

USER=
TOKEN=
REPO=
KEY=

for arg in "$@"; do
  case $arg in
  -u=* | --user=*)
    USER="${arg#*=}"
    shift
    ;;
  -k=* | --key=*)
    KEY="${arg#*=}"
    shift
    ;;
  -t=* | --token=*)
    TOKEN="${arg#*=}"
    shift
    ;;
  -r=* | --repo=*)
    REPO="${arg#*=}"
    shift
    ;;
  *)
    OTHER_ARGUMENTS+=("$1")
    shift
    ;;
  esac
done

for SINGLE_FOLDER in */; do
  cd $SINGLE_FOLDER
  . $DOTFILES/scripts/code/upload-to-bitbucket.sh --repo=$REPO --user=$USER --token=$TOKEN --key=$KEY
  cd ..
done

# . $DOTFILES/scripts/code/upload-folders-to-bitbucket.sh \
#   --repo="archive-of-projects-bitbucket" \
#   --user="foo@bar.com" \
#   --key="MISC" \
#   --token="TOKEN_GOES_HERE"
