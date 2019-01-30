#!/usr/bin/env bash
set -e

git -C test-project pull || git clone https://github.com/andock/test-project.git

bats environment.bats
