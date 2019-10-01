#!/bin/sh

grep ^VERSION_ID /etc/os-release | awk -F '=' '{print $2}'
