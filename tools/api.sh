#  REQUIREMENTS
# Visual Studio Code https://code.visualstudio.com/
# pip install j2cli
# yay -S httpie jq fx

handle_response() {
  local FILE=$(print_json $1)
  echo ">>> JSON CREATED: $FILE"
  [[ "$API_LEVEL_DEBUG" == "code" ]] && code $FILE
  [[ "$API_LEVEL_DEBUG" == "log" ]] && fx $FILE
}

build_api_call() {
  local API_URL=${1:-edx.com}
  local METHOD=${2:-GET}
  local OUTPUT=${3:-http}
  local JSONREQUEST=${API_JSON_DATA:-}
  local HEADERS=${API_HEADER_ADITIONAL:-$API_HEADERS}
  local API_CALL=""
  local EXTRA_PARAMS=""

  [[ "$OUTPUT" == "http" || "$OUTPUT" == "plain" ]] && OUTPUT=" --body"
  [[ "$OUTPUT" == "json" ]] && OUTPUT=" --body" && EXTRA_PARAMS=" | fx"
  [[ "$OUTPUT" == "debug" ]] && OUTPUT=" --verbose"

  if [[ $METHOD == "POST" || $METHOD == "PUT" || $METHOD == "DELETE" ]]; then
    [[ "$JSONREQUEST" != "" ]] && API_CALL="http $METHOD $API_URL $API_AUTH $HEADERS $OUTPUT <$JSONREQUEST $EXTRA_PARAMS"
    [[ "$JSONREQUEST" == "" ]] && API_CALL="http $METHOD $API_URL $API_AUTH $HEADERS $OUTPUT $EXTRA_PARAMS"
  elif [[ $METHOD == "GET" ]]; then
    API_CALL="http $METHOD $API_URL $API_AUTH $HEADERS $OUTPUT $EXTRA_PARAMS"
  else
    API_CALL=""
  fi
  echo $API_CALL
}

handle_output() {
  local URL=${1:-example.com}
  local METHOD=${2:-GET}
  local OUTPUT=${3:-http}
  local FILE=${4:-false}
  local API=$(build_api_call $URL $METHOD $OUTPUT)

  if [[ $OUTPUT == "json" || $OUTPUT == "debug" || $OUTPUT == "plain" ]]; then
    eval $API
  elif [[ $OUTPUT == "http" ]]; then
    local RESPONSE=$(eval $API)
    handle_response $RESPONSE
  else
    echo "output not supported: http|json|debug|plain"
  fi
}

print_json() {
  local UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  local CONTENT=${1:-}
  local RESPONSE=${2:-/tmp/$UUID.json}
  echo $CONTENT >$RESPONSE
  echo $RESPONSE
}

handle_json() {
  local JSON_NAME=${2:-JSON}
  local JSON_PATH=${1:-"$HOME/.auna/api-data/endpoint__action.json"}
  local TMPL=$(j2 $JSON_PATH)
  export API_JSON_DATA=$(print_json $TMPL)
  echo ">>> $JSON_NAME CREATED $API_JSON_DATA"
}
