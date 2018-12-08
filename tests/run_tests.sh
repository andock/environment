#!/usr/bin/env bash
set -e

git -C demo-project pull || git clone https://github.com/andock/demo-project.git

bats environment.bats
