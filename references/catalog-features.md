# Optional feature catalog

Grouped extensions from the complete assistant-expanded catalog. Every family and
subitem is a candidate, not a required feature. Select only supported mechanics
and surfaces and record selected/excluded/deferred/unknown. Variants sharing
semantics can reuse one component. Values, thresholds, math, and policies require
project evidence.

## Controls and financial display

| ID | Family | Candidate elements/variants | Contract needed |
| --- | --- | --- | --- |
| F01 | Spin inputs | Hold-to-spin, Space/keyboard, swipe, quick stop | Repeat/hold/gesture policy; focus exclusions |
| F02 | Autoplay | Fixed/unlimited count if supported, resume, active marker/stop reason; stop on win/threshold/loss/balance/bonus/session limit/error/connection loss | Allowed conditions, count event, pause/stop/resume semantics |
| F03 | Speed | Normal/Fast/Turbo/Instant/Quick Spin, accelerated win/bonus intro, skip, hold acceleration | Allowed modes by phase; essential information retained |
| F04 | Bet composition | Slider/input, min/max/current/previous, line bet/active lines/coin value/count/total/multiplier, purchase stake/ante/feature bet, locked marker, credits/currency | Values; cost calculation; draft/commit boundary |
| F05 | Balance | Credits/currency/bonus/available/locked, wallet/deposit, update animation, demo/virtual balance | Canonical fields; demo label; platform navigation |
| F06 | Win details | Round/bonus/free-spin/respin/combination/line/cluster/cascade/scatter/multiplier/jackpot/mini-game amounts, count-up/final, max-win/payout limit, xBet | Aggregation, authoritative amount, limit source |
| F07 | Win categories | Win/Nice/Big/Mega/Super/Epic/Ultra/Massive/Legendary/Max; fullscreen/count-up/sound/Skip/Continue | Project names and thresholds; no universal xBet tiers |

## Field and mechanics

| ID | Family | Candidate elements/variants | Contract needed |
| --- | --- | --- | --- |
| F08 | Field/reels/grid | Container/reels/cells/symbols/background/frame; spin/active/winning/appear/remove/transform/lock animations; expanding/dynamic rows, hidden/extra reels, zones/second field, ways count | Game geometry and timeline; no assumed 5x3 grid |
| F09 | Combinations | Active/winning lines, number/amount/sequential display; clusters/ways/participating symbols/combination count | Canonical combinations and display sequence |
| F10 | Symbols | Wild/Expanding/Sticky/Walking/Moving/Multiplier Wild; Mystery/Scatter/Bonus/Collect/Cash/Jackpot/Multiplier/Transforming/Locked/Extra Spin/Upgrade/progress | Meaning/value and appear/activate/accumulate/transform/remove/complete |
| F11 | Free spins | Available/remaining/used/additional/current counters, total win/multiplier/terms, entry/exit/retrigger/summary, Continue | Bonus identity; counter updates; settlement timing |
| F12 | Respins / Hold & Win | Remaining/used/reset, locked monetary symbols, filled/empty cells/progress, total/multiplier/jackpot, extra respins/summary | Reset rule; persistent cells; termination |
| F13 | Cascades | Index/consecutive-win count/current-total multiplier/removed count/removal/fall/chain total/end | Many steps can belong to one round without extra wagers |
| F14 | Multipliers | Current/total/accumulated/symbol/reel/cell/bonus/win/max; increment/combine/apply/reset | Add/multiply/order/scope/reset contract |
| F15 | Purchase | Entry/type list/price/stake-relative cost/description/max-win info/availability/confirm/cancel/error/active/charge | Quote source/version, eligibility, accepted cost, recovery |
| F16 | Other bonus games | Pick & Click/wheel/ladder/trail/board/chest/coin or symbol collection/reel upgrades/expansion/random Wild or multiplier or feature/levels/unlocks/retrigger/persistent feature | Mechanic-specific choices/counters/progress/confirm/summary |
| F17 | Gamble | Entry/collect/exit/continue/attempts/eligibility/risk/potential/max/loss/history; color/suit/high-low/red-black/coin/wheel/ladder/hidden-object/double-or-nothing/levels | Authoritative eligibility/outcome; choice/collect commands |
| F18 | Progression | Symbols/coins/keys/objects/level/XP/collection/multiplier/bonus or jackpot progress/Wild/unlocks/threshold/reset/carry-over/saved progress | Round/bonus/session/account lifetime; persistence owner |
| F19 | Jackpots | Mini/Minor/Major/Grand or other tiers; fixed/progressive/value/count-up/eligible/active/acquisition/selection/result/accumulation/terms/history/other-player notice | Freshness/unit/eligibility; estimate versus confirmed win |

## Promotions and platform surfaces

| ID | Family | Candidate elements/variants | Contract needed |
| --- | --- | --- | --- |
| F20 | Gifts | Available/remaining/used spins/win/active/terms/source/expiry/new/expiring/activation/completed/unavailable/history/regular-play switch | Promotional gift spins distinct from game free spins; activation/expiry owner |
| F21 | Daily rewards | Entry/calendar/streak/day/available/claimed/missed/next timer/Claim/acquisition/series end | Canonical clock; claim idempotency; persistence |
| F22 | Events/promotions | Banner/join/active/start-end timers/progress/prizes/list/detail/new/reward/end/promo code if supported | Backend support; no fabricated schedules |
| F23 | Tournaments | Entry/active/name/start-end/rank/points/participants/leaderboard/prizes/pool/scoring/updates/registration/start/end/results/reward/history/lobby | Event identity, freshness, rules, navigation |

## Settings, information, runtime

| ID | Family | Candidate elements/variants | Contract needed |
| --- | --- | --- | --- |
| F24 | Navigation | Menu/settings open-close/fullscreen/lobby/quit/restart/help/info/history/replay/rules/Back/Close/Continue/Confirm/Cancel | Safe actions with pending rounds; platform callbacks |
| F25 | Audio | Master/music/effects/voice toggles and sliders/reset/level/save | Channel mix, persistence, platform audio unlock |
| F26 | Preferences | Quality/effects/animation/performance/vibration/language/orientation/compact/accessibility/reduced motion/contrast/scale | Supported capabilities/persistence; no fixed presets |
| F27 | Rules/paytable | Sections/symbol values/specials/combinations/bonuses/free spins/respins/gamble/purchase/multipliers/jackpots/max-win/RTP-volatility if required/min-max bet/pages/examples/demos | Approved math/config; never invent RTP/payout values |
| F28 | History/replay | Round ID/time/bet/win/balance before-after/type/bonus/details; play/pause/resume/speed/step/result/unavailable | Read-only data; pagination/timezone; no live mutation |
| F29 | Preloader | Game/provider logo/background/bar/percent/spinner/stage/assets/server/completed/Start | Real progress and readiness; failure handling |
| F30 | Runtime wait | Fullscreen/compact/server/bonus/resource/mode/history/replay/rules/download/indeterminate/long-wait/Retry/delay message | Asset retry differs from uncertain money command |

## Cross-cutting and host surfaces

These families cover the later sections of the expanded catalog. They describe
possible UI surfaces; the game client may render them, delegate them to the host,
or omit them when unsupported.

| ID | Family | Candidate elements/variants | Contract needed |
| --- | --- | --- | --- |
| F31 | Notices and game copy | Success/error/unavailable toasts; info/warning banners; contextual tooltips; reward, balance, bet, speed, autoplay, limit, multiplier, bonus, tournament, connection, and action-required notices; reel-area text/ticker/animated layer; prompts such as Good Luck, Press Spin, Collect, Feature Complete, Max Win | Severity, priority, placement, lifetime, deduplication, localization, and which messages need an action instead of a transient notice |
| F32 | Reusable counters and timers | Spin/autoplay/free-spin/respin/bonus-attempt/collection/combination/cascade/multiplier/points/reward/task/gamble/line/ways counters; event, reward, gift, tournament, attempt, offer, session, auto-close/transition, server-wait timers | Count event and scope; canonical clock, pause/reconnect/expiry behavior, and whether a countdown is advisory or authoritative |
| F33 | Embedded mini-game UI | Card, wheel, chest/door/character/hidden-object selection, multi-stage board/path/ladder/prize field, score collection, sequential reveal, stop-and-collect; rules, choices, counters, timers, result and confirmation surfaces | Feature identity, allowed choices, phase guards, confirmed result, resume/exit/collect behavior; F16 lists the mechanics |
| F34 | Host/platform frame | Operator/provider branding, game/version/session/player identifiers; support/chat/lobby/profile/wallet/deposit; account/VIP/loyalty/bonus, promo/tournament/mission links | Which surfaces the host owns, allowed callbacks, privacy of identifiers, capability and unavailable states |
| F35 | Limits and legal information | Regional/game restrictions, responsible-play entry, configured limits, time/spend reminders, reality check, session-end notice, terms/privacy/license/age information | Host-provided content and jurisdiction-specific requirements; do not invent policy, thresholds, or legal claims |
| F36 | Onboarding and contextual help | First-run tutorial, control highlight, step-by-step feature explanation, skip, seen marker, contextual tooltip | Trigger, focus/input ownership, persistence, replay/reset, and whether guidance may interrupt a live round |
| F37 | Interactive field objects | Tappable symbols and characters, objects with hints, hidden rewards, object selection, drag and drop, confirmations on reels | Active mode/phase, hit areas, feedback, accepted intent, cancellation, and accessibility alternatives |
| F38 | Mode and scene transitions | Base/bonus/gamble and return, multiple fields, recovery of unfinished spin/bonus/multiplier/free spins/mini-game, theme/music/background changes | Canonical mode and progress, transition timing, restoration source, and safe handling of pending operations |
| F39 | Responsive/system UI | Desktop/mobile and portrait/landscape composition, safe area/notches, field scaling, relocated controls, compact menu/expandable actions, rotate prompt, focus-loss/return, keyboard/touch/focus/pressed/disabled, system zoom and virtual-keyboard overlap | Supported environments, preserved action/state across reflow, and input/focus behavior; see layout guidance |
| F40 | Localization and currencies | Multiple currencies/credits, precision and grouping, long values/translations, right-to-left layout, font adaptation, localized dynamic messages | Currency source and unit conversion, locale, supported languages, formatting, and no truncation of material amounts |

Dialog variants are in `catalog-dialogs.md`. The cross-cutting families are still
catalog possibilities; the engineering rules for them live in the state, contract,
and layout references.
