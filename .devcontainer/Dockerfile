# syntax=docker/dockerfile:1

ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

COPY .devcontainer/scripts/*.sh /tmp/

# Install packages using the apt package manager.
# A list of common packages will be installed along with any packages you list
# here.
RUN /tmp/apt.sh <<EOF
openjdk-17-jdk
EOF

# Install common shell hooks (e.g. asdf, completion).
RUN /tmp/hooks.sh

USER vscode

COPY --chown=vscode .tool-versions /home/vscode/.tool-versions

# Install packages using the asdf package manager.
RUN /tmp/asdf.sh <<EOF
babashka
clojure
github-cli
leiningen
EOF
