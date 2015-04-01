#!/usr/bin/env bash

# Check if the user as passed in the generator name.
[ -e $1 ] &&
echo "Generator name is a must."
&& exit -1;

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

if which xdg-open > /dev/null
then
  xdg-open $URL
elif which gnome-open > /dev/null
then
  gnome-open $URL
elif which open > /dev/null
then
  open $URL
else
  echo "No sensible browser."
fi

echo "Running $1 in debug mode."
node --debug $(which yo) $1
