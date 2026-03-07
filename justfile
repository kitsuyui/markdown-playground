# https://just.systems

default:
  @just --choose

lint:
    #!/bin/sh
    typos docs
    pnpm exec markdownlint-cli2 "docs/**/*.md"
    pnpm exec textlint "docs/**/*.md"

format:
    #!/bin/sh
    typos docs --write-changes
    pnpm exec markdownlint-cli2 "docs/**/*.md" --fix
    pnpm exec textlint "docs/**/*.md" --fix
