#!/usr/bin/env bash

set -euo pipefail

# ---------------------------------------------------------------------------- #

# Reconfigure lein and download all other dependencies.

./scripts/profiles.sh > ~/.lein/profiles.clj

lein deps

# ---------------------------------------------------------------------------- #
