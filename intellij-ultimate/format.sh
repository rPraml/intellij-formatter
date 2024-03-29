#!/bin/sh
# ------------------------------------------------------
# IntelliJ IDEA formatting script.
# ------------------------------------------------------

echo "Using modified format.sh"

groupadd -g "$UID" "$UNAME"
useradd -u "$UID" -g "$UID" --no-create-home -d /tmp "$UNAME"

su "$UNAME" -c "mkdir -p /tmp/ic/config"
su "$UNAME" -c "cp /tmp/config/idea.key /tmp/ic/config"
su "$UNAME" -c id

IDE_BIN_HOME="${0%/*}"
cat /tmp/config/idea64.vmoptions >> ${IDE_BIN_HOME}/idea64.vmoptions
su "$UNAME" -c "$IDE_BIN_HOME/idea.sh"\ format\ "$*"

