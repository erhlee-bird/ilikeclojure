#!/usr/bin/env bash
#
# The user runs the script by providing a list of packages to install with the
# asdf package manager via stdin. The entries are provided as space-delimited
# pairs of the plugin name and optional plugin source.
#
# See https://github.com/asdf-vm/asdf-plugins for the list of known plugins that
# allow shorthand installation.
#
# e.g.
#
# ```
# $0 <<EOF
# github-cli
# flyctl https://github.com/erhlee-bird/asdf-flyctl.git
# EOF
# ```

set -eo pipefail

[[ ! -f "${HOME}/.asdf/asdf.sh" ]] && {
  git clone https://github.com/asdf-vm/asdf ~/.asdf --branch v0.10.2
}

# shellcheck disable=1091
. "${HOME}/.asdf/asdf.sh"

# ---------------------------------------------------------------------------- #

# Install plugins with asdf.

while IFS= read -r line || [ -n "$line" ]; do
  read -a linevars -r <<<"${line}"
  # <plugin name> [<plugin source>]
  #
  # The plugin version to install will be determined by:
  #
  # 1. looking up the plugin in ~/.tool-versions
  # 2. defaulting to "latest"
  name="${linevars[0]}"
  source="${linevars[1]}"

  [[ -z "${name}" ]] && continue

  version="$(grep "${name}" "${HOME}/.tool-versions" 2>/dev/null | cut -d ' ' -f 2)" || :
  [[ -z "${version}" ]] && version="latest"

  if [[ -z "${source}" ]]; then
    asdf plugin add "${name}" || :
  else
    asdf plugin add "${name}" "${source}" || :
  fi
  asdf install "${name}" "${version}" || :
  asdf global "${name}" "${version}"
done

# ---------------------------------------------------------------------------- #
