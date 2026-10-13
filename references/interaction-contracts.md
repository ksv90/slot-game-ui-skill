# Interaction contracts and project decisions

Engineering recommendations in this reference are not source-user approvals.
Record current project evidence before selecting behavior. Unknown values stay
unknown; mock data must be labeled and isolated from live operations.

## Element contract

For each affected element capture: catalog ID; purpose and label; visible states;
enabled guard and explanation; pointer/touch/keyboard intent; canonical data owner;
display unit/scope; command and event mapping; loading/error/empty/unavailable;
modal/feature dependencies; focus; layouts; persistence; recovery; verification.
Use existing project formats; do not mandate a component class or reactive library.

## Optional library composition

The expanded catalog proposes four useful levels for a reusable UI library:
primitives (Button, Counter, Timer, Modal), game components (SpinButton,
BetSelector, FreeSpinsCounter), modules (MainControls, AutoplayDialog,
TournamentPanel), and game UI states (BaseGame, Spinning, FreeSpins, Recovery).
This is a design aid, not a required hierarchy or framework. Separate visual
reuse from game semantics: autoplay, free-spin, and respin counters may share a
Counter primitive while keeping distinct source events, scopes, formatting, and
transition rules. A game mechanism or scenario is not automatically a widget.

## Decision prompts

| Area | Resolve from project evidence | Common confusion to prevent |
| --- | --- | --- |
| Spin/Skip | Replacement versus separate control; quick-stop support; phase gates | A square icon means wager cancellation |
| Bet | Allowed values/composition/min-max, staged or locked changes, effective round | Updating displayed bet changes the wager already submitted |
| Amounts | Units/currency/credit conversion/precision/grouping/round and bonus scopes | Floating display interpolation becomes account truth |
| Balance | Available versus total/bonus, update timing, staleness, demo mode | Assuming a rejected-looking timeout restored money |
| Autoplay | Supported/allowed, counts/conditions/limits, stop reason/resume policy | Counter click initiates a second paid round; modal close resumes automation |
| Speed | Selected modes/availability, animation scope, persistence | Turbo changes RNG/payout or skips required information |
| Bonus purchase | Capability, eligibility, quote source/expiry, price basis, confirmation | Stale displayed price becomes accepted server price |
| Bonus counters | Remaining/used/current number, grant/retrigger/reset/end events | Zero counter ends a bonus before final result/settlement |
| Multipliers | Scope/operator/application/reset and canonical total | Summing a product or applying it twice to displayed win |
| Gifts | Promotional versus game-earned spins, terms/expiry/stake/activation/conflicts | Decrementing gift count on a rejected intent |
| Gamble | Eligibility/risk/max attempts/outcome/collect and unavailable states | Collect is a cosmetic close action |
| Continue | Acknowledge presentation versus feature command/claim | Continue silently commits another bet |
| History/replay | IDs/timezone/pagination/availability/playback ownership | Historical playback mutates live wallet or round state |
| Rules | Approved config version/paytable/RTP/locale/source | Catalog labels supply payout or compliance values |
| Dialogs | Shell/content, priority, dismissibility, focus/backdrop/back/escape | Closing shell resolves command uncertainty |
| Navigation | Host callbacks, fullscreen support/exit, safe quit/resume | Local fullscreen flag is always the browser/platform state |
| Progress/wait | Real progress source, stages/readiness, safe retry, delay copy | Fake percentage implies server certainty |
| Settings | Audio channels/master, supported visuals/locale/quality/save/reset | Every renderer supports every preference |
| Notices/timers | Transient versus blocking message, priority, lifetime, clock source, expiry | A toast replaces required action or a local countdown grants a reward |
| Mini-games/field objects | Choice phase, hit area, stop-and-collect, confirm, resume | A visual selection implies an accepted authoritative choice |
| Platform surfaces | Host-owned links, limits, identifiers, support, legal copy | Game client invents account state or jurisdiction rules |

## Ownership boundary

The UI emits intents and presents state. The game/host adapter owns eligible
actions, supported features, canonical stake, outcome, and account data. Client
validation improves feedback but does not replace authoritative checks. Slot
mathematics, RNG, settlement protocols, account management, and payment flows are
outside this skill; connect only through project-defined interfaces.

For integration failures, distinguish validation failure, explicit rejection,
asset failure, and unknown transactional outcome. Each needs a different recovery
path. Retry a known safe read/asset fetch according to project policy; leave an
ambiguous money operation pending until reconciled. Show a readable reason rather
than raw internal traces.
