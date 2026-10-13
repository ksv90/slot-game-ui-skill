# Provenance and requirement levels

## Evidence available for version 1.0.0

The originating discussion requested the widest structured inventory of possible
slot UI elements, without committing to placement or a particular game. Its
complete user-authored list was available. The follow-up requested a locally
installable skill with future public distribution and no framework coupling.
The current brief requests catalogs, states, checklists, portability, sources,
validation, and ZIP packaging. MIT was explicitly selected in this task.
These scope choices are confirmed; individual interaction policies are not.

The user-authored element list is normalized into `C01`–`C36` in `catalog-core.md`
without removing alternatives. The earlier assistant's expanded catalog was
available as a bounded 20,000-character excerpt, ending within generic modal
components. The optional catalogs summarize categories visible in that excerpt.
This package does not claim complete reproduction of the entire assistant answer.
Engineering recommendations added during skill creation are labeled separately.

Private conversation URLs, account identifiers, transcripts, synced sources,
project code, brand assets, and personal paths are excluded from the publishable
package. Public readers do not need access to the conversations.

## Labels and precedence

| Label | Meaning | Use |
| --- | --- | --- |
| Core catalog | Explicit element/alternative in the user list | Consider applicability; never force it into every game |
| Optional catalog | Expanded suggestion in the assistant excerpt | Select for a supported feature |
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
