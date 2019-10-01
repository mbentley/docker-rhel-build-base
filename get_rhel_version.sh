#!/bin/sh

# check to see if we are running RHEL; if so, get the version
if [ -f /etc/os-release ] && grep -q '^ID="rhel"$' /etc/os-release
then
  grep '^VERSION_ID=' /etc/os-release | awk -F '=' '{print $2}'
else
  echo "Not RHEL"
  exit 1
fi
