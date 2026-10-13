# Scoped checklists

These are engineering review aids. Mark each applicable item pass/fail/blocked/
not applicable, with evidence. Proposed tests are not executed tests. Use only the
parts relevant to the task; a small label fix does not require a full game audit.

## Inventory and decisions

- [ ] New UI: all C01–C36 entries accounted for as selected/excluded/deferred/unknown.
- [ ] Targeted change: affected IDs and dependencies identified without scope growth.
- [ ] Optional families have capability/evidence; no feature included by assumption.
- [ ] Variant choices, units, scopes, thresholds, and persistence documented.
- [ ] Project requirements separated from source catalog and recommendations.
- [ ] Placement inside settings/windows still represented; shared shell/content separated.

## States and actions

- [ ] Available/disabled/hidden/pending/error/unavailable states match real capabilities.
- [ ] Accepted activation latches before async/render; repeated inputs do not duplicate intents.
- [ ] Round identity and effective bet snapshot survive events/layout changes/recovery.
- [ ] Skip preserves outcome/account truth and shows accurate final win information.
- [ ] Timeout/disconnect does not unlock a new wager or trigger an unsafe resend.
- [ ] Late/duplicate responses do not double credit/count or overwrite newer data.
- [ ] Bet draft and committed stake are distinct; changes affect the intended next round.
- [ ] Balance/win/bonus total and multipliers carry correct scope and units.
- [ ] Dialog close does not resolve pending operations; no focus/input click-through.

## Selected features

- [ ] Autoplay start/count/conditions/end/reason follow a defined policy.
- [ ] Stop prevents scheduling the next autoplay round, including boundary races.
- [ ] Resume after modal/error/reconnect/foreground follows explicit policy.
- [ ] Bonus entry/Continue/steps/retrigger/reset/end/summary use authoritative events.
- [ ] Gift spins remain distinct from free spins and have defined expiry/activation scope.
- [ ] Purchase shows the applicable quote/cost, validates changes, and recovers uncertainty.
- [ ] Gamble choices and Collect have distinct guarded commands and accurate risk display.
- [ ] History/replay are isolated from live wallet, wager, bonus, and autoplay state.
- [ ] Promotions/tournaments/jackpots show supported data and appropriate freshness.
- [ ] Disabled/absent capabilities do not leave broken entries or unreachable windows.

## Presentation and usability

- [ ] Selected layouts work with safe areas, viewport changes, and long content.
- [ ] Orientation/fullscreen does not recreate logical game operations.
- [ ] Touch/keyboard/pointer map to the same action guards; shortcut focus exclusions work.
- [ ] Icon names, status communication, focus return, and reachable actions verified where supported.
- [ ] Reduced motion/skip/speed preserve meaningful information and final amounts.
- [ ] Loading progress is real or explicitly indeterminate; asset and server wait differ.
- [ ] Audio/visual settings persist as selected; capability limits are visible.
- [ ] Currency precision, localized strings/counters, and history timezone verified.

## Scenario matrix (choose applicable rows)

| Probe | Expected evidence |
| --- | --- |
| Two activations before next render | One accepted intent through all supported input routes |
| Insufficient funds / explicit rejection | Known reason; account reconciled; no accidental retry |
| Timeout after command accepted | Same operation queried/restored; no second wager |
| Result arrives twice / out of order | No duplicate credit/counter; newer account state preserved |
| Skip while waiting / revealing / celebrating | Guards differ; canonical result unchanged |
| Stop autoplay just before next scheduling | No future automatic start; in-flight result completes |
| Final free spin plus retrigger / respin reset | Correct counter and feature state through summary |
| Purchase quote changes / gamble choice pending | Updated decision boundary; pending lock/recovery |
| Overlay stack and close/input reuse | Clear priority; no deadlock or click-through |
| Resize/orientation/fullscreen during round | Same IDs/counters/state and reachable controls |
| History unavailable / replay interaction | Read-only error/playback; live state unchanged |

## Handoff

- [ ] Requested artifact/code/review is complete for the available contract.
- [ ] Report actual checks, failures, blocked integrations, and unresolved decisions.
- [ ] Mock data and untested claims labeled; no certification or production readiness implied.
- [ ] Catalog IDs and project decisions can be traced without private conversations.
