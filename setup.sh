#!/usr/bin/env bash

# Note that this will automagically be ran if you have rvm installed.
# This shell file sets up the following aliases whenever you cd into
# the current directory tree:
#
# + ember
# + npm
# + bower
#
# If rvm is not installed then you can simply run:
#   . setup.sh
#
# Note that these aliases revert back to executing the system version
# of each command whenever you exit the current project dir tree.

PREV_ROOT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function npm() {
	if [[ $PWD/ = $PREV_ROOT_DIR/* ]]; then
		# echo "docker-compose -f $PREV_ROOT_DIR/docker-compose-dev.yml run --rm npm $@"
		docker-compose -f $PREV_ROOT_DIR/docker-compose-dev.yml run --rm npm $@
	else
		# echo "`which npm` $@"
		`which npm` $@
	fi
}

function bower() {
	if [[ $PWD/ = $PREV_ROOT_DIR/* ]]; then
		# echo "docker-compose -f $PREV_ROOT_DIR/docker-compose-dev.yml run --rm bower $@"
		docker-compose -f $PREV_ROOT_DIR/docker-compose-dev.yml run --rm bower $@
	else
		# echo "`which bower` $@"
		`which bower` $@
	fi
}

function ember() {
	if [[ $PWD/ = $PREV_ROOT_DIR/* ]]; then
		# echo "docker-compose -f $PREV_ROOT_DIR/docker-compose-dev.yml run --rm ember $@"
		docker-compose -f $PREV_ROOT_DIR/docker-compose-dev.yml run --rm ember $@
	else
		# echo "`which ember` $@"
		`which ember` $@
	fi
}

# manual method of aliasing that persists when outside of current dir (BAD)
# alias   npm='docker-compose -f docker-compose-dev.yml run --rm npm'
# alias bower='docker-compose -f docker-compose-dev.yml run --rm bower'
# alias ember='docker-compose -f docker-compose-dev.yml run --rm ember'

# echo 'Configured npm, bower, and ember for current project'
