#!/bin/bash

set -e

ruby="$1"; shift
mkdir -p $ruby
cd $ruby
rbenv local $ruby
ruby ../run.rb
