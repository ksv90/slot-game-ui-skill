# Local installation and portability

Version 1.0.0. Paths and product guidance checked 2026-10-13. The portable unit is
the complete `slot-game-ui/` folder with SKILL.md, references, assets, and license.
The skill does not execute tools or contact a service. Review instructions before
enabling them. It is compatible at the file-format level with Agent Skills
loaders; behavior has not been tested in every vendor's application.

## Codex: user scope

Current official discovery locations are described in
[Build skills](https://learn.chatgpt.com/docs/build-skills). Extract the provided
ZIP into a new staging directory, then copy its skill folder. Avoid installing
multiple copies with the same name into both user and project scopes unnecessarily.

macOS/Linux example, from the directory containing the downloaded ZIP:

```sh
unzip -n skill.zip -d ./slot-game-ui-unpacked
mkdir -p "$HOME/.agents/skills"
if [ -e "$HOME/.agents/skills/slot-game-ui" ]; then
  printf '%s\n' 'Skill already exists; review and back it up before replacing it.'
else
  cp -R ./slot-game-ui-unpacked/slot-game-ui "$HOME/.agents/skills/slot-game-ui"
fi
```

Use a fresh staging directory if `slot-game-ui-unpacked` already contains a previous
version; `unzip -n` does not replace old files. For the source repository, copy
`skills/slot-game-ui` rather than the repository root. Keep installation commands
as user-invoked operations; merely reading this skill does not authorize installation.

Windows PowerShell example, from the download directory:

```powershell
Expand-Archive -Path .\skill.zip -DestinationPath .\slot-game-ui-unpacked
$slotSkillRoot = Join-Path $env:USERPROFILE '.agents\skills'
New-Item -ItemType Directory -Force -Path $slotSkillRoot | Out-Null
$slotSkillTarget = Join-Path $slotSkillRoot 'slot-game-ui'
if (Test-Path $slotSkillTarget) {
  Write-Output 'Skill already exists; review and back it up before replacing it.'
} else {
  Copy-Item -Recurse .\slot-game-ui-unpacked\slot-game-ui $slotSkillTarget
}
```

Explicitly invoke `$slot-game-ui` in Codex CLI/IDE or select it through `/skills`.
Where the UI uses `@` selection, select Slot Game UI from the skills interface.
Codex can also select it when a task matches its description. If discovery does
not update, restart the application. Installation alone does not force invocation
on every task. The included OpenAI policy allows implicit invocation.

## Project/team scope

Copy the skill folder into `<game-repository>/.agents/skills/slot-game-ui` and
commit it with the game's repository if the team chooses. Apply the same existing-
folder check before copying. Current Codex scans repository `.agents/skills`
locations from the current directory up to the repository root.

To make usage explicit for all agents that read a project's AGENTS.md (or equivalent),
add a scoped rule to that existing file after reviewing the project's conventions:

```text
For tasks that design, implement, refactor, or review slot game interfaces,
read .agents/skills/slot-game-ui/SKILL.md and follow the relevant references.
Preserve the current project scope, framework, and confirmed game contracts.
Catalog entries are selection candidates, not universal feature requirements.
```

This is a suggested integration rule, not an instruction to edit any unrelated
project automatically. Agents that do not read that file need their own loader
or equivalent instruction. Do not claim that one installation reaches all agents.

## Other environments

- If the host supports Agent Skills, use its documented skill directory or import
  workflow and preserve the entire folder. See the
  [portable format](https://agentskills.io/specification). Do not assume a shared
  installation path across vendors or that every host accepts a ZIP directly.
- `agents/openai.yaml` is optional OpenAI-specific metadata. The domain instructions
  do not depend on it. A host may ignore it without losing catalog or state guidance.
- Without a loader, place the folder in accessible project documentation and tell
  the agent to read SKILL.md for slot UI work. Follow links on demand. Automatic
  selection and product-specific UI metadata are unavailable in this fallback.
- For restricted/sandboxed agents, make these files accessible using the host's
  documented mounted files or attachments. No additional connector is required.

## Upgrade, uninstall, GitHub

Review the new version, back up your local edits, and replace only this skill's
folder; do not merge stale references silently. Uninstall by removing only the
installed `slot-game-ui` folder and any explicit scoped rule you added. Avoid
editing global configuration unless you intentionally manage this skill there.

For GitHub distribution use the complete source repository and publish skill.zip
as a Release asset. Users can download it and follow this guide or ask their
environment's skill installer to install `skills/slot-game-ui` from the repository
at a reviewed tag/commit. A repository URL is not automatic global installation.
