#! /bin/sh

DIR=$( cd "$( dirname "$0" )" && pwd )
cd $DIR

pry -r $DIR/app.rb
