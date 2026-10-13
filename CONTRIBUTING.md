# Development and release guide

The installable skill is plain documentation. Maintainers need Git and, to build
its ZIP locally, Bash, `zip`, `unzip`, and `shasum`. No npm or Python setup is
required.

## Check commit messages locally

From the repository root, enable the tracked hook in this repository only:

```sh
git config --local core.hooksPath .githooks
```

The hook checks the subject before a commit is created. It accepts `feat`, `fix`,
`perf`, `docs`, `style`, `refactor`, `test`, `build`, `ci`, `chore`, and `revert`, with
an optional scope and breaking `!`. For example:

```text
fix: correct a spin guard
feat(ui): add a selected bonus counter
feat!: change the public skill invocation
```

A `BREAKING CHANGE:` footer is supported by Release Please when the subject is
otherwise conventional. Git-generated merge subjects are exempt from the hook.
GitHub Actions checks commit subjects after they reach `main`. It does not run
on pull requests. Hooks can be bypassed locally, so review commit messages and
the release pull request before merging. Do not require the **Skill and commit
checks** status on pull requests; that check runs on `main` before publication.

## Validate and package locally

```sh
bash scripts/package-skill.sh
(cd dist && shasum -a 256 -c skill.zip.sha256)
unzip -l dist/skill.zip
```

This checks the skill identity and version, required files and catalog IDs, rejects
symlinks in the distributable directories, then creates `dist/skill.zip` and
`dist/skill.zip.sha256`. The ZIP contains one `slot-game-ui-skill/` directory with
skill instructions, references, assets, and documentation. It excludes Git data,
workflows, hooks, release configuration, and scripts. The archive integrity check
does not establish behavior in every agent host or a real game. The script reads
the current working files, so it can package uncommitted changes for local review.

## Release flow

Only `main` is released. [Release Please](https://github.com/googleapis/release-please-action)
reads Conventional Commits and proposes a release pull request. Review its
`CHANGELOG.md`, `version.txt`, manifest, and `SKILL.md` changes. The initial release
is configured as `1.0.0`; `.release-please-manifest.json` starts at `0.0.0` to
indicate that no release has yet been published. Do not treat the initial value in
`version.txt` or `SKILL.md` as an already-published tag.

The manifest is Release Please's record of published versions and is required for
this manifest configuration, which also updates `SKILL.md`. The `simple` release
strategy manages `version.txt`; that file is not included in the installable ZIP.
The actual skill metadata version remains in `SKILL.md`, and the local build
checks that it matches `version.txt`.

Merging the release pull request causes the main-branch workflow to create the
version tag and GitHub Release. In that same workflow run, a fresh checkout of the
tag is packaged and its ZIP and checksum are attached to the release. A normal
feature or fix commit on `main` proposes or updates the release pull request; it
does not publish a version immediately. `feat` usually means minor, `fix` patch,
and a breaking `!` or `BREAKING CHANGE:` major. Other accepted types can appear in
history without opening a release pull request by themselves.

Release Please creates the release pull request automatically. This workflow
does not run on pull requests, including those created by `github-actions[bot]`,
so GitHub does not ask for separate approval to start their checks. Review and
merge the release pull request yourself when its changes are ready. The `main`
workflow validates the skill and commits before it publishes a version.

The workflow uses the repository's `GITHUB_TOKEN` by default. In repository
Settings → Actions → General, allow GitHub Actions to create pull requests, and
permit the workflow's requested write permissions. An optional
`RELEASE_PLEASE_TOKEN` secret can provide a different GitHub App or personal
access token identity if repository policy requires it. The workflow does not
change repository settings.

The release job is serialized. It builds and uploads the ZIP in the same run as
Release Please because a tag created using `GITHUB_TOKEN` does not normally start
a separate workflow. No local command in this repository creates a tag or release.

## Repair release assets

If the tag and release exist but asset upload failed, open **Actions → Repair
release assets → Run workflow** on `main` and enter the existing `vX.Y.Z` tag.
The workflow verifies tag syntax and ancestry, checks out that tag, builds the
matching ZIP, then uploads or replaces the two assets. It does not bump the
version or create a new tag. Use this only after investigating the failed run.

Source: [Release Please action and outputs](https://github.com/googleapis/release-please-action),
[extra-file version markers](https://github.com/googleapis/release-please/blob/main/docs/customizing.md).
