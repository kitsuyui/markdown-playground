# https://just.systems

default:
  @just --choose

lint:
    #!/bin/sh
    typos docs
    bunx markdownlint-cli2 "docs/**/*.md"
    bunx textlint "docs/**/*.md"

format:
    #!/bin/sh
    typos docs --write-changes
    bunx markdownlint-cli2 "docs/**/*.md" --fix
    bunx textlint "docs/**/*.md" --fix
