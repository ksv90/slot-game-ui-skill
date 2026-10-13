# Framework-neutral state model

This is an illustrative engineering model, not user-approved game rules or a
required state-machine implementation. Map it to an existing engine's vocabulary.
Keep distinctions even when the implementation combines labels. Use an offline
authoritative adapter for prototypes; label simulated outcomes.

## Component state vocabulary

The expanded catalog also lists cross-cutting states. Treat them as dimensions to
consider for each selected component, not one enum or a requirement to implement
every state: Default, Hover, Pressed, Focused, Disabled, Hidden, Loading, Pending,
Active, Selected, Completed, Success, Error, Locked, Expired, Attention, and
Transitioning. For touch-only UI, Hover may not apply; Hidden differs from a
visible disabled control. Record which states matter and what the user sees and
can do in each.

A control can change semantic role as well as appearance. A shared button location
may present Spin, Skip/Stop, autoplay count, or Continue, but each role needs its
own intent and guard. Do not infer the action from an icon or displayed number.
For wagering, purchase, and Gamble, distinguish request sent, result unknown,
and result confirmed by the authoritative source.

## Orthogonal concerns

| Concern | Illustrative states/data | Source of truth |
| --- | --- | --- |
| Session | loading, ready, suspended, recovering, failed; connection/auth/capabilities | Session/engine adapter |
| Operation | none, pending, accepted, outcome-known, settlement-pending, settled, rejected, unknown; intent ID, round ID, quote/version | Authoritative command/result/round contract |
| Presentation | idle, spinning, revealing, celebrating, feature-entry, feature-step, feature-exit | Client timeline consuming canonical results |
| Mode | base, free-spins, respins, gift-rounds, mini-game, gamble, replay; feature ID/step | Confirmed game state; replay isolated |
| Autoplay | off, running, stop-requested, paused, completed; target/remaining/reason | Selected autoplay policy plus confirmed round events |
| Overlay | none, informational, blocking; type, dismissal policy, focus owner | UI coordinator; does not own operation completion |

For example a client can be recovering with an unknown operation, an interrupted
spinning presentation, and a blocking recovery overlay. A single boolean `isSpinning`
cannot represent whether another wager is safe. Animation completion and settlement
may arrive in either order. Some contracts settle atomically with the outcome;
others require a separate acknowledgement. Document the actual mapping.

## Illustrative transitions

| Event | Guard/context | Effect | UI implication |
| --- | --- | --- | --- |
| Assets/session ready | Configuration, account/round state known | Session ready; restore mode/round if one exists | Ready controls only after reconciliation |
| Spin activation | Start predicate below | Capture effective stake/mode; latch intent before asynchronous work; operation pending | Pending status; duplicate starts blocked |
| Server accepts without final outcome | Matching intent | Operation accepted; preserve IDs | Animate waiting if supported; no new wager |
| Canonical outcome arrives | Matching operation/round/version | Store outcome once; operation outcome-known or settlement-pending | Reveal confirmed result; stop waiting indication |
| Presentation finishes | No unresolved feature presentation step | Presentation idle; retain canonical operation state | Ready only if operation and mode allow it |
| Settlement/round-close confirmed | Matching operation | Settled; update account/round data once | Another permitted round may become available |
| Explicit rejection | Contract establishes no accepted wager for this intent | Rejected; show known reason; refresh data if needed | May return to ready after reconciliation |
| Timeout/disconnect/malformed reply | Acceptance or settlement uncertain | Operation unknown; session recovering; preserve intent/round data | Block new wager; display recovery status |
| Recovery returns active round | Authoritative lookup | Resume accepted/outcome/feature state; reconcile balance | Continue correct mode and presentation |
| Recovery confirms settled round | Authoritative lookup | Restore result/account; settled | Required summary or ready per project |
| Recovery confirms no accepted round | Explicit contract evidence | Rejected/none as appropriate | Permit next intent once account/mode are ready |
| Recovery remains unknown | No conclusive evidence | Remain recovering; use contract-defined bounded retry/manual next action | Never assume failure and resend a new wager |
| Stop/Skip | Confirmed skippable presentation phase | Shorten/finish timeline; preserve canonical result and operation | Show accurate final information; never cancel settlement |
| Start autoplay | Capability enabled; validated configuration | Autoplay running; request each next round through the same start gate | Counter/reason and accessible stop |
| Stop autoplay | Any running/waiting automation state | Inhibit future automatic starts immediately; stop-requested/off | In-flight round continues normally |
| Autoplay stop condition | Selected condition event | Inhibit next start; paused/completed/off per policy; record reason | No hidden restart after modal/reconnect |
| Feature trigger | Canonical game event | Feature-entry and confirmed feature mode | Counters from feature data; Continue if selected |
| Continue on feature entry | Required acknowledgement known | Advance presentation or send required feature command | Does not silently place an ordinary paid spin |
| Feature step/result/retrigger | Matching feature ID/step | Update canonical counters/progress and selected presentation | No reset/decrement inferred from animation |
| Feature completes | Authoritative end, settlement/collection known | Feature-exit/summary then mode restoration | Do not return to base solely because counter shows zero |
| Purchase or gamble choice | Eligibility, quote/risk, input valid; no conflicting operation | Dedicated pending intent; same uncertainty handling | Cost/risk explicit; controls guarded |
| Open/close window | Window policy permits | Update overlay/focus; operation unchanged | No accidental start from a reused pointer/key event |
| Enter replay | Historical record loaded; allowed live-mode policy | Isolated replay state/data/control intents | No wager, account update, or autoplay from playback |

## Derive action guards

### Illustrative control projection

Use this conservative projection as a starting point until the project's contract
defines its alternatives. It does not prescribe icons or placement.

| Context | Spin/Skip | Bet/purchase/gamble | Autoplay and Continue |
| --- | --- | --- | --- |
| Loading/session unresolved | Start unavailable; show meaningful loading | Transactional actions unavailable | No automatic start |
| Ready eligible base mode | Start if start guard passes | Bet edit and supported actions use separate guards | Configure/start only if selected |
| Pending/accepted, result unknown | No second start; waiting presentation may animate | No conflicting operation; staged bet only if supported | Stop future autoplay remains reachable |
| Outcome known, presentation active | Supported Skip/quick-stop; no outcome mutation | Follow round/settlement gates | Counter updates only at specified event |
| Win celebration | Skip/final amount if supported; next start follows contract | No collection or purchase inferred from celebration end | Next automatic start waits for its permitted boundary |
| Required bonus entry/summary | Ordinary paid start unavailable | Feature-specific restrictions | Continue performs the defined acknowledgement/command |
| Bonus step | Feature start/skip only if eligible; may be automatic | Mode-specific stake/eligibility | Bonus counter independent of autoplay counter |
| Unknown outcome/recovery | No new paid start; recovery status | Preserve pending operation and effective stake | Inhibit future starts; resume only by policy |
| Gamble/purchase pending | Prevent conflicting live starts | Guard repeated choice/confirm/collect | Dismissal never creates a new operation |
| Replay | Playback intents only | Read-only historical amounts | Live autoplay not triggered by playback |
| Blocking overlay | Commands respect overlay and underlying operation | Close does not remove transaction locks | Keep selected stop/recovery action reachable |

Illustrative `canStartRound` requires session ready, an eligible playable mode,
no unresolved conflicting operation, a valid effective wager or entitlement,
fresh enough authoritative data, and no blocking overlay. Affordability uses the
actual cost contract; gift/free-spin rounds may differ from paid base rounds.
The engine must enforce the same rule as the visible control. Do not hard-code
one rule for all bonus modes. A contract may allow overlapping presentation and
a subsequent settled round; implement that only when explicitly supported.

`canSkip` derives from presentation, known results, and engine support. A cosmetic
quick-stop during waiting is only a supported waiting-animation change, never
fabrication of a result. `canEditBet`, `canPurchase`, `canGamble`, `canCollect`,
`canContinue`, and `canOpenPanel` need separate guards. Choose whether bet changes
are forbidden mid-round or staged for the next round; do not mutate its snapshot.

## Identity, recovery, counters

- Keep intent IDs, round IDs, feature IDs, and steps distinct. Dedupe duplicate
  responses and prevent older events overwriting newer account state using the
  contract's version/order mechanism. Do not invent a backend idempotency API.
- Use existing idempotency keys/status lookup if supported. When unsupported,
  expose the integration gap; do not retry an ambiguous money command automatically.
- Never resend a wager just because a loader is dismissed, assets retry, orientation
  changes, or the connection returns. Recovery delay/count/exit are project decisions.
- Define autoplay count as accepted starts or completed rounds and apply it once
  per round. Define free-spin/respin count and retrigger/reset from engine events.
  Autoplay exhaustion and bonus progress are different domains.
- Keep settled amounts distinct from displayed count-up values. Skip sets the
  presentation to its canonical final amount; it does not apply credits again.
- Pause/suspension does not cancel a round. Reconcile on foreground/restore;
  automatic resume is an explicit project choice, never an assumption.

## Recommended transition probes

Run applicable probes in the project's test tools or manual harness: repeated
Spin before the next render; timeout after accepted debit; late/duplicate result;
Skip before and after outcome; stop autoplay at a scheduling boundary; disconnect
at feature entry; respin reset/retrigger; purchase quote change; gamble pending
choice; replay with live controls; overlay dismissal and orientation mid-round.
Specify expected behavior before testing and report what was actually executed.
