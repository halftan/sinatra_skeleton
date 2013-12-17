#! /usr/bin/env sh

DIR=$( cd "$( dirname "$0" )" && pwd )
kill -s INT `cat ${DIR}/tmp/pids/thin.pid`
