# https://just.systems

default:
  @just --choose

lint:
    #!/bin/sh
    rc=0
    typos docs || rc=$?
    bunx markdownlint-cli2 "docs/**/*.md" || rc=$?
    bunx textlint "docs/**/*.md" || rc=$?
    exit $rc

format:
    #!/bin/sh
    rc=0
    typos docs --write-changes || rc=$?
    bunx markdownlint-cli2 "docs/**/*.md" --fix || rc=$?
    bunx textlint "docs/**/*.md" --fix || rc=$?
    exit $rc
