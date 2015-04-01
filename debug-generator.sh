#!/usr/bin/env bash

# Check if the user as passed in the generator name.
[ -e $1 ] && \
echo "Generator name is a must." \
&& exit -1;

# OS check.
function isOsx {
  [[ "$OSTYPE" == "darwin"* ]] && echo 1 || echo 0;
}

function isGnu {
  [[ "$OSTYPE" == "linux-gnu" ]] && echo 1\
 || echo 0;
}

# Error out.
function noChrome {
  echo "Please install chrome." && exit -1;
}
function osNotSupported {
  echo "OS not supported." && exit -1;
}

# Check if google chrome is installed!
if isOsx; then
  [[ ! -e "/Applications/Google Chrome.app" ]] && noChrome
elif isGnu; then
  [[ ! -e $(which google-chrome) ]] && noChrome
else
  osNotSupported
fi

# Check if node-inspector is installed.
if which node-inspector >/dev/null; then
  echo "Good, you have node-inspector."
else
  echo "Installing node inspector..."
  npm install -g node-inspector
fi

echo "Starting node inspector"
node-inspector&


URL=http://localhost:8080/debug?port=5858

(isOsx && open -a "Google Chrome" $URL) \
|| (isGnu && $(which google-chrome) $URL)\
|| osNotSupported

echo "Running $1 in debug mode."
node --debug $(which yo) $1


# Clean up trap.
set -e
function cleanup {
  echo "Cleaning up..."
  pkill node-inspector
  echo "Done!"
  exit 0;
}
trap cleanup EXIT
