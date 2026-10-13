---
name: slot-game-ui-skill
description: "Design, implement, refactor, or review framework-neutral slot game UI: controls, game and platform surfaces, optional features, states, and recovery. Use for slot interface tasks in any engine. Excludes slot mathematics, RNG design, and standalone account or payment systems."
license: MIT
metadata:
  version: "1.0.2" # x-release-please-version
---

# Slot Game UI

Build a coherent interface from an explicit feature selection and state contract.
Use the project's existing engine, renderer, components, events, and design conventions.
This skill supplies domain vocabulary and review criteria; it does not select a
framework, reel layout, art style, or payout model. Respond in the user's language;
stable catalog IDs remain language independent.

## Interpret the catalog correctly

- **Core catalog** means elements explicitly named in the originating brief.
  It is an inventory to consider, not a mandatory screen or minimum feature set.
- **Optional catalog** means assistant-suggested extensions or feature-dependent
  variants. Include them only when project scope supports them.
- **Engineering recommendation** means guidance supplied by this skill, not a
  claim that the originating user approved that behavior.
- **Project decision** means a choice the game's contract must settle: visibility,
  thresholds, speed modes, locking, automation, currencies, and platform behavior.

Read [provenance](references/provenance.md) when attributing requirements or extending
the catalog. Never promote an inventory entry into a universal requirement. Follow
the current brief and project instructions. If missing information affects a wager,
outcome, or recovery, identify the open question and complete independent work while
it is resolved. Do not invent financial rules.

## Scope the task

For a new interface, map each core entry to selected, excluded, deferred, or unknown
with reasons and evidence. For a targeted fix, inspect affected elements and
dependencies without expanding into a full redesign. Determine whether the task is
a specification, implementation, refactor, or review. Inspect existing code and
approved design references before introducing behavior.

Use [core elements](references/catalog-core.md) for the initial inventory. Read
[feature extensions](references/catalog-features.md) only for selected mechanics,
cross-cutting surfaces, or host integration, and [dialogs](references/catalog-dialogs.md)
for windows and overlays. Location inside a menu or settings does not remove an
element from the inventory. Separate a reusable dialog shell from each dialog's
content and actions.

Capture scope and unresolved decisions in the
[project profile template](assets/project-profile.template.yaml), or in the
project's equivalent format. This is documentation, not a required runtime schema.
Never add unspecified autoplay, bonus purchase, gamble, gifts, tournaments, or
payment navigation just because they occur in the catalog.

## Establish behavior before wiring controls

Read [state model](references/state-model.md) for commands, server uncertainty,
presentation, recovery, feature transitions, and cross-cutting component states.
Adapt names to the existing game;
do not replace its architecture solely to match this illustrative model.
Read [interaction contracts](references/interaction-contracts.md) to settle control
ownership, amounts, counters, dialogs, capability gates, and optional library
composition.

Essential correctness constraints for integrations with wagers or authoritative
outcomes:

- Emit at most one logical wager intent per accepted activation; guard duplicate
  input synchronously, beyond just displaying a disabled button.
- Preserve round identity across presentation, history, and recovery. A timeout
  or disconnected client does not prove that a wager failed.
- Stop/Skip changes presentation only unless the authoritative contract explicitly
  supports another operation. Do not label skipping as cancellation of a wager.
- Show balances, stakes, wins, and counters with their scope and units. Never let a
  visual counter become the source of truth for settlement or bonus progress.
- Derive available actions from state and capabilities. Dismissing an overlay does
  not unlock an unresolved round. Stopping autoplay prevents future automatic
  starts and does not undo an in-flight round.

These are engineering constraints of this skill, not quoted user approvals.
For prototypes, label simulated data and keep the same command distinctions.
For missing server semantics, provide an adapter boundary or specification and
report the dependency rather than simulating a successful transaction.

## Implement or review the selected slice

Choose composition, layout, inputs, and animation within project conventions. Keep
canonical game data separate from displayed animation values; map intent to commands
and confirmed events to updates. Preserve behavior in a refactor unless changing it
is requested. Optional mechanics need explicit capability checks and applicable
unavailable states.

Read [layout and accessibility](references/layout-accessibility.md) for responsive
and input decisions. Honor supported desktop/mobile and portrait/landscape modes,
currency formatting, localization, focus, and actual renderer capabilities. Do not
treat recommended accessibility details as an invented regulatory standard.

Use relevant parts of [checklists](references/checklists.md). Prefer observable
behavior checks: repeated activation, ambiguous timeout, mode transitions, modal
overlap, orientation changes, and counter updates. Match verification to changed
scope and tooling; distinguish executed from proposed checks. Static mockups cannot
prove server recovery or settlement.

## Deliver a reviewable result

For a specification: provide selected IDs, behavior by state, command/data ownership,
layouts, and open decisions. For implementation/refactor: deliver code, summarize
preserved/changed behavior, verification, and integration limits. For a review:
report concrete findings with affected states, reproduction, and corrections.

Do not dump the entire catalog into every answer. Keep recommendations visibly
separate from requirements and do not claim unexecuted tests passed.

Installation/distribution: [INSTALL.md](INSTALL.md). The skill itself requires no
network, connector, or executable helper.
