#!/usr/bin/env bash
set -e

git -C test-project pull || git clone https://github.com/andock/test-project.git

mkdir -p ~/.andock
cp version.env ~/.andock/version.env
bats environment.bats

