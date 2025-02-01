#!/bin/bash

sudo mv configuration.nix /etc/nixos/configuration.nix
sudo nix-rebuild switch
