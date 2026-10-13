# Provenance and requirement levels

## Source coverage

The originating discussion requested a broad inventory of possible slot UI
elements, without committing to placement or a particular game. Its complete
user-authored list was available for the core inventory. The later, detailed
assistant-generated “Catalog of slot game UI components” is now available in
full as user-supplied text: all 21 numbered sections and its proposed four-level
composition were reviewed. The follow-up requested a locally installable,
framework-neutral skill with future public distribution, catalogs, states,
checklists, validation, and ZIP packaging. MIT was explicitly selected. These
scope choices are confirmed; individual catalog suggestions and interaction
policies are not blanket user approvals.

The user-authored element list is normalized into `C01`–`C36` in `catalog-core.md`
without removing alternatives. The complete assistant expansion is normalized
into optional families `F01`–`F40`, dialog scenarios `D01`–`D19`, and the state,
contract, layout, and checklist references. This is a grouped inventory, not a
verbatim copy or a claim that every item belongs in every game. Engineering
recommendations added during skill creation are labeled separately.

| Expanded source sections | Normalized location |
| --- | --- |
| 1–2 Controls, betting, balance, wins | Core entries and F01–F07 |
| 3–7 Field, bonus mechanics, gamble, progress, jackpots | F08–F19; state/interaction contracts |
| 8–9 Gifts, rewards, promotions, tournaments | F20–F23 |
| 10–12 Settings, rules/history, loading | F24–F30 |
| 13 Dialogs and reusable modal parts | D01–D19; reusable shell contract |
| 14 Notices and dynamic messages | F31 |
| 15 Counters and timers | F32; state/interaction contracts |
| 16 Embedded mini-games | F16, F33, D11, D18 |
| 17 Platform and external integrations | F34–F35, D19 |
| 18 Responsive/system UI | F39; layout reference |
| 19 Cross-cutting component states | State-model component vocabulary |
| 20 Game scenarios affecting UI | Checklist scenario coverage |
| 21 Tutorial, recovery/transitions, field interaction, localization | F36–F38, F40; state/layout references |
| Proposed primitives/components/modules/states | Optional library composition in interaction contracts |

Private conversation URLs, account identifiers, transcripts, the pasted source
file, synced sources, project code, brand assets, and personal paths are excluded
from the publishable package. Public readers do not need access to the conversation.

## Labels and precedence

| Label | Meaning | Use |
| --- | --- | --- |
| Core catalog | Explicit element/alternative in the user list | Consider applicability; never force it into every game |
| Optional catalog | Suggestion in the full assistant-expanded catalog | Select for a supported feature or surface |
| Engineering recommendation | Authored for reliable implementation/review | Adapt recommendations; preserve transactional correctness |
| Project decision | Behavior/placement/threshold not settled by the user | Use current evidence or record as unresolved |
| Current project requirement | Current brief, code contract, approved design, project instructions | Record evidence; overrides generic catalog suggestions |

Changing unknown to enabled requires project evidence, not the presence of a row.
Keep prototype assumptions explicit and reversible. Do not infer legality,
certification, autoplay permission, RTP, or financial contracts from this skill.
If asked to investigate jurisdiction-specific rules, use current authoritative
sources and record them in the project profile.

## Extensions

Preserve IDs. Add proposed entries with new IDs and provenance; do not silently
rewrite core history. A requirement for one game belongs in its project profile,
not in a universal mandate. Keep provider metadata optional and domain instructions
neutral.
