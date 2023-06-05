USER=
TOKEN=
REPO=

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

get_groups() {
  for group in $(http https://$REPO/api/v4/groups PRIVATE-TOKEN:$TOKEN | jq '.[] | .id'); do
    get_projects $group
  done
}

get_projects() {
  for project in $(http https://$REPO/api/v4/groups/$1/projects PRIVATE-TOKEN:$TOKEN | jq '.[] | .path_with_namespace' -r); do
    clone_project $project
  done
}

clone_project() {
  echo ">>> Git Clonning https://$USER:$TOKEN@$REPO/$1.git"
  git clone https://$USER:$TOKEN@$REPO/$1.git

  echo ">> going to $(basename $1 .git)"
  cd $(basename $1 .git)
  pwd

  echo ">> getting al branches"
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  echo ">>> returning to revious repo"
  cd ..
}

echo ">>> Clonning all repos from Gitlab"
get_groups

echo ">>> DONE"
unset REPO USER TOKEN
