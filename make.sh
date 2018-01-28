#!/bin/sh
EXEC=/bin/sh

# get absolute path to dir of the dotfiles' repo
REPO_DIR=$(cd $(dirname $0) && pwd)

# load convenient functions
. ${REPO_DIR}/sh/util.sh

specific() {
  cmd=$1
  op=$2
  script=${REPO_DIR}/inst/${cmd}/make.sh
  if [ -e $script ]; then
    log info "Executing ${script}."
    $EXEC $script $op
  else
    log fail "$script not found."
  fi
}

# available: install, clean
if [ -z $1 ]; then
  op=install
else
  op=$1
fi

if [ ! -z $2 ]; then
  specific $2 $op
  exit 0
fi

# install or clean configulations in $XDG_CONFIG_HOME
specific config $op

# execute command-specific installations
targets=$(find ${REPO_DIR}/inst/* -maxdepth 0 -type d)
for target in $targets
do
  cmd=$(basename $target)
  if has $cmd; then
    specific $cmd $op
  fi
done