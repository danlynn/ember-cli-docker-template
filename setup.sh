#!/usr/bin/env bash

# Note that this will automagically be ran if you have rvm installed.
# This shell file sets up the following aliases whenever you cd into
# the current directory tree.
#
# If rvm is not installed then you can simply run:
#   . setup.sh
#

alias   npm='fig -f fig-dev.yml run --rm npm'
alias bower='fig -f fig-dev.yml run --rm bower'
alias ember='fig -f fig-dev.yml run --rm ember'
echo 'Configured npm, bower, and ember for current project'
