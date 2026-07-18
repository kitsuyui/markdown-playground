# markdown-playground

Playground for Markdown linting with markdownlint, textlint, and typos.

## Commands

Install the pinned local toolchain first so the package scripts and the `just`
recipes use the same Bun release as CI and `package.json`.

```sh
mise install
```

Then use either the package scripts or the `just` recipes; both entrypoints run
the same docs checks through Bun 1.3.11.

```sh
bun run lint:docs
bun run format:docs

just lint
just format
```

## Development

Install [lefthook](https://github.com/evilmartians/lefthook) and set up the Git hooks:

```sh
lefthook install
```

The hooks run the following recipes:

- **pre-commit**: `just lint` — runs typos, markdownlint-cli2, and textlint against `docs/**/*.md`
- **pre-push**: `just lint` — same checks before pushing

CI still runs the full suite on every pull request and push to main.

## Lint rule updates

Documentation lint dependencies are pinned to exact versions in `package.json`.
Textlint presets can add or tighten rules in minor releases, so rule changes
should land as explicit dependency updates rather than incidental `bun install`
drift.

When updating markdownlint or textlint dependencies, update `bun.lock` in the
same pull request and run `bun run lint:docs` against the existing documents.
If a new rule changes current diagnostics, include the document fixes or a
configuration note in that update so callers can review the migration impact.
