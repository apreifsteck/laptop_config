#!/bin/bash
set -euxo pipefail

HOST="$(hostname -s)"
USER="$(whoami)"

rm -rf /users/${USER}/applications/home\ manager\ apps.backup  \
&& rm -rf /users/${USER}/applications/home\ manager\ apps
git add -A
nix build .#darwinConfigurations.${HOST}.system
./result/sw/bin/darwin-rebuild switch --flake . 
