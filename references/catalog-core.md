# Core element catalog

All 36 entries trace to the complete user-authored list. Inclusion means inventory
coverage, not mandatory presence. Alternatives share an ID where they serve one
semantic purpose. Behavior notes are engineering recommendations; exact placement,
locking, shortcuts, speed modes, and thresholds remain project decisions.

For selected entries record: role, variants, visibility, enabled guard, input intent,
canonical source, scope/units, dependencies, recovery, layouts, and project evidence.

| ID | User-named element | Alternatives and behavior to specify |
| --- | --- | --- |
| C01 | Spin button | Ready/pending/animating/result-ready/locked; one accepted start intent |
| C02 | Change-bet control | Selector and/or plus/minus; allowed steps and locks |
| C03 | Autoplay control | Start/configure/stop future automatic rounds |
| C04 | Autoplay counter | Remaining or completed; may be inside Spin; decrement event and scope |
| C05 | Turbo or speed control | Toggle or multiple modes; names, availability, persistence |
| C06 | Fullscreen on/off | Supported/requested/actual state, exit, unavailable |
| C07 | Balance | Confirmed amount, unit/currency, loading/stale, display animation |
| C08 | Current bet | Total committed wager versus draft; effective round and unit |
| C09 | Skip/Stop control | Separate square button may replace Spin; available phase and semantics |
| C10 | Buy bonus | Availability/type/cost/confirmation and unresolved purchase |
| C11 | Sound on/off | Master or channels; muted state and persistence |
| C12 | Volume sliders | Channels/range/mute interaction/persistence |
| C13 | Rules entry | Approved rules/paytable; navigation/loading |
| C14 | Settings entry | Open/close/focus; may contain other entries |
| C15 | Game history entry | Empty/loading/error/populated round history |
| C16 | Replays within history | Per-round availability; read-only playback/unavailable |
| C17 | Last/current win | Distinguish last settled round from current reveal |
| C18 | Accumulated bonus win | Bonus-session scope; distinct from last/current win |
| C19 | Bonus counters | Free spins/respins/other bonus; remaining/current/completed/retrigger |
| C20 | Total multiplier | Scope/source; combination/application/reset contract |
| C21 | Gift information | Available/active/completed, remaining spins, terms where supported |
| C22 | Continue button | Example: bonus entry; acknowledge/advance/collect differ |
| C23 | Loading progress | Preloader/loading screen/in-game; multiple variants; known/unknown progress |
| C24 | Insufficient-balance dialog | Cause, required amount when known, dismiss/next actions |
| C25 | Gifts available/completed dialogs | Separate content/actions; activation not assumed |
| C26 | Critical-error dialog | Recoverable versus terminal; safe actions |
| C27 | Autoplay-configuration dialog | Count, selected stop conditions, validation, confirm/cancel |
| C28 | Bet list | Supported values, draft/selected/committed, min/max/loading |
| C29 | Bonus-game selection dialog | Types, costs, selection, confirm/cancel where applicable |
| C30 | Settings window | Selected settings, persistence, window lifecycle |
| C31 | Rules window | Approved data, pages/scroll/navigation, locale/loading |
| C32 | Content-loading/server-wait window | Distinguish assets from unresolved commands; no unsafe resend |
| C33 | Events/tournaments information | Selected event data/timing/position/rewards |
| C34 | Daily/other bonus information | Availability/terms/claim/result where supported |
| C35 | Embedded mini-games | Independent phases within window or scene |
| C36 | Gamble controls and dialogs | Risk recent win for increase/loss; eligibility/choices/collect/result |

An element inside settings, drawer, dialog, or platform panel remains in inventory.
Shared shells do not erase distinct states or intents.

## Separations to preserve

- C03 control and C04 counter are distinct even if composed into C01.
- C09 may occupy Spin's position; an icon replacement alone does not define behavior.
- C17 round win and C18 bonus total need separate scopes to prevent double counting.
- C15 history and C16 replay may share a window but have different data lifecycles.
- C22 Continue does not imply a new bet or collection of unsettled funds.
- C23 progress and C32 blocking wait may share visuals with different semantics.
- C10 purchase and C29 selection may share UI; cost and accepted intent need a contract.
