# https://just.systems
# typos version is pinned in .mise.toml. Run `mise install` to install the pinned version.

default:
  @just --choose

lint:
    #!/bin/sh
    set -e
    typos docs
    bunx markdownlint-cli2 "docs/**/*.md"
    bunx textlint "docs/**/*.md"

format:
    #!/bin/sh
    set -e
    typos docs --write-changes
    bunx markdownlint-cli2 "docs/**/*.md" --fix
    bunx textlint "docs/**/*.md" --fix
