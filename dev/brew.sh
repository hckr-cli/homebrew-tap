#!/bin/bash

SOURCE="/Users/ashishpatel/pateash/homebrew-core/Formula/h/hckr.rb"

#FLAGS="--debug --verbose"
FLAGS="--verbose"
function clean(){
  echo "Cleaning all caches"
  brew cleanup $FLAGS
  echo "====================================="
}

function uninstall(){
  echo "Uninstalling if exists"
  brew uninstall $FLAGS hckr
  echo "====================================="
}

function install(){
  echo "Installing from sources"
  brew install $FLAGS --build-from-source $SOURCE
  echo "====================================="
}

function test(){
  echo "Testing hckr"
  brew test $FLAGS hckr
  echo "====================================="
}

function audit(){
  echo "Audit hckr"
  brew audit --strict $FLAGS hckr
  echo "====================================="

}

function style(){
  echo "Style hckr"
  brew style $FLAGS $SOURCE
  echo "====================================="
}

CMD=$1

COMMANDS="\n==========================\ntest - Run brew test \ninstall - Install from sources\nuninstall- Uninstall hckr\nclean - Clean cache\checks - Run all tests"

if [ -z $CMD ]; then
    echo -e "Please pass COMMAND, Please use $COMMANDS"
    exit 1
fi

case $CMD in
install)
  install
  ;;
uninstall)
  uninstall
  ;;
clean)
  clean
  ;;
checks) # run all checks
  test
  audit
  style
  ;;
*)
  echo -e "Invalid command '$CMD', Please use $COMMANDS"
  exit 1
esac


