#!/usr/bin/env bash
#
# Setup bashrc hooks for tools like asdf and direnv.

set -eo pipefail

cat <<EOF >>/etc/bash.bashrc

. ~/.asdf/asdf.sh
. ~/.asdf/completions/asdf.bash

eval "\$(direnv hook bash)"

EOF
