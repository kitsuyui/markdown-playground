# https://just.systems
# Bun and typos are pinned in .mise.toml. Run `mise install` before using these recipes.

default:
  @just --choose

lint:
    #!/bin/sh
    bun run lint:docs

format:
    #!/bin/sh
    bun run format:docs

gitignore:
    gitignore.in
