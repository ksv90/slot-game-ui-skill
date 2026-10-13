# Slot Game UI Skill

A framework-neutral Agent Skill for designing, implementing, refactoring, and
reviewing slot game interfaces. It uses the project's existing engine and renderer;
it does not prescribe reel geometry, art style, payout rules, or a settlement API.
The skill itself needs no runtime dependencies or network access.

## Contents

| Resource | Purpose |
| --- | --- |
| [SKILL.md](SKILL.md) | Agent entrypoint, scope, workflow, and correctness constraints |
| [Core catalog](references/catalog-core.md) | 36 entries from the original user-authored list |
| [Optional features](references/catalog-features.md) | 30 grouped feature families from the available expanded catalog |
| [Dialogs](references/catalog-dialogs.md) | 18 scenarios or optional families of windows and overlays |
| [State model](references/state-model.md) | Operations, presentation, features, autoplay, and recovery |
| [Interaction contracts](references/interaction-contracts.md) | Ownership, amounts, counters, guards, and project decisions |
| [Layout and accessibility](references/layout-accessibility.md) | Layout, input, focus, localization, and motion |
| [Checklists](references/checklists.md) | Scoped implementation and review checks |
| [Project profile](assets/project-profile.template.yaml) | Documentation template with undecided capabilities |
| [Provenance](references/provenance.md) | Source coverage and requirement levels |
| [INSTALL.md](INSTALL.md) | Installation and portability |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Local checks, commit conventions, and releases |

Core means an element explicitly named in the original brief, not a required
feature in every game. Optional suggestions, engineering recommendations, and
project-specific decisions remain separate.

The skill uses both the original list and the later detailed “Catalog of slot game
UI components.” The original user list was available in full. The detailed assistant
answer was available only as a 20,000-character excerpt ending within generic modal
components. Visible extensions were grouped into optional feature/dialog catalogs;
this skill does not claim a complete or verbatim transfer of the expanded answer.

## Install and use

Download **skill.zip** from the
[latest GitHub Release](https://github.com/ksv90/slot-game-ui-skill/releases/latest).
The archive contains one folder named `slot-game-ui-skill`. Follow
[INSTALL.md](INSTALL.md), then invoke `$slot-game-ui-skill` in a compatible host.
For environments without a loader, ask the agent to read SKILL.md and the relevant
references on demand. OpenAI metadata in `agents/openai.yaml` is optional for other
hosts; automatic discovery depends on the application.

```text
Use $slot-game-ui-skill to specify a mobile slot interface.
Free spins and history are supported; autoplay, bonus purchase, and gamble are not.
Keep the existing renderer. Identify selected elements, state transitions,
data ownership, layouts, and unresolved project decisions.
```

A targeted request can name only the affected controls, such as Spin, Skip, and
reconnect behavior. The skill should not expand that work into a full redesign.

## Build a ZIP locally

From the root of this repository (the folder containing `SKILL.md`), run:

```sh
bash scripts/package-skill.sh
(cd dist && shasum -a 256 -c skill.zip.sha256)
unzip -l dist/skill.zip
```

This requires Bash, `zip`, `unzip`, and `shasum`; it does not require npm or
Python. The result is `dist/skill.zip` and `dist/skill.zip.sha256`. The script
packages the current files on disk, including any uncommitted edits. It does not
create a Git commit, tag, or GitHub Release. See [CONTRIBUTING.md](CONTRIBUTING.md)
for the checks performed before packaging.

## Development and releases

There is no npm package or local release dependency. A Bash Git hook can check
Conventional Commit subjects before a local commit. GitHub Actions validates
commits, pull request titles, and the skill files. See [CONTRIBUTING.md](CONTRIBUTING.md)
for setup and the exact checks.

[Release Please](https://github.com/googleapis/release-please-action) proposes a
release pull request after relevant commits reach `main`. The pull request shows
the next version and changelog for review. Once it is merged, the same workflow
creates the `vX.Y.Z` tag and GitHub Release, builds `skill.zip` from that tag, and
attaches the ZIP and SHA-256 checksum. Release Please maintains the version in
`SKILL.md` and `version.txt` through release pull requests. The first release is
configured as `1.0.0`.

The two release bookkeeping files have different jobs:
`.release-please-manifest.json` records the last published version for Release
Please, while its `simple` strategy updates `version.txt`. The version agents see
is the metadata in `SKILL.md`. The packaging script checks that `version.txt` and
`SKILL.md` agree.

`feat` ordinarily raises the minor version, `fix` the patch, and a breaking change
the major version. Other valid commit types do not necessarily create a release on
their own. The skill's version is recorded in `SKILL.md`; no npm artifact is
published. Release tooling stays out of the installable ZIP. Licensed under
[MIT](LICENSE).
