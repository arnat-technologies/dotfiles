#! /bin/zsh

# DISPLAY_USAGE="
# [Author] Roy Surjano [https://www.surjano.xyz/]
#          Creates a new repo on bitbucket & update remotes & upload all branches

#          -u --user   | USERNAME of bitbucket
#          -p --pass   | PASSWORD of bitbucket
#          -r --repo   | REPOSITORY of bitbucket

# Dependency:
#     - httpie
# ------------------------------------------------------------------"

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
  -t=* | --token=*)
    TOKEN="${arg#*=}"
    shift
    ;;
  -k=* | --key=*)
    KEY="${arg#*=}"
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

PWD=$(pwd)
BASE_FOLDER=$(basename $PWD)

# echo "$USER $TOKEN $KEY $REPO"
echo ">>> Creating repository for $BASE_FOLDER"
TR="{\"has_wiki\": false, \"is_private\": true, \"project\": {\"key\": \"$KEY\"}}"
echo $TR | http --verbose --auth $USER:$TOKEN --json POST https://api.bitbucket.org/2.0/repositories/$REPO/$BASE_FOLDER

echo ">>> Uploading all branches"

if [ ! -d ".git" ]; then
  echo ">>> GIT not found, creating base commit"
  git init
  git add .
  git commit -m "adding base commit for bitbucket" --author="Developer <foo@bar.com>"
fi

echo ">>> Updating repo with latest changes"
# git fetch --all
# git pull --all
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done

echo ">>> Configuring repository"
git remote remove origin
git remote add origin git@bitbucket.org:$REPO/$BASE_FOLDER.git

echo ">>> Uploading to bitbucket"
git push --all

# . $CONCEPTS/upload-to-bitbucket.sh \
#   --repo="archive-of-projects-bitbucket" \
#   --user="foo@bar.com" \
#   --key="MISC" \
#   --token="TOKEN_GOES_HERE"
