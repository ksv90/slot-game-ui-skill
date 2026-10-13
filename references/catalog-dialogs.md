# Dialogs, windows, overlays

Core scenarios below trace to the user list; optional scenarios summarize the
available assistant expansion. Shell behavior and priorities are engineering
recommendations. Choose a dialog, panel, scene, drawer, toast, or inline surface
according to the project; the catalog does not require every message to be modal.

## Core scenarios

| ID | Scenario | Core IDs | Actions and information to settle |
| --- | --- | --- | --- |
| D01 | Insufficient balance | C24 | Required/available amounts if known; dismiss or platform-provided next action |
| D02 | Gift available | C25, C21 | Terms/source/eligibility; activate/select/later only if supported |
| D03 | Gift completed | C25, C21 | Confirmed scope/total; Continue or dismiss |
| D04 | Critical error | C26 | Known cause and safe recovery/navigation; terminal distinction |
| D05 | Autoplay configuration | C27, C03, C04 | Count/stop conditions/validation/confirm/cancel |
| D06 | Bet list | C28, C02, C08 | Supported values; draft change/commit/cancel |
| D07 | Bonus selection/purchase | C29, C10 | Types/cost/eligibility/selection/confirmation/cancel/pending |
| D08 | Settings | C30, C14 | Selected settings; apply/persist/close policy |
| D09 | Rules | C31, C13 | Approved rules/paytable; pages/back/close/loading |
| D10 | Content loading/server wait | C32, C23 | Explain what is waiting; progress if known; retry only when safe |
| D11 | Gamble/embedded mini-game | C36, C35 | Entry/rules/choice/pending/result/collect/exit per game |

## Optional scenario families

| ID | Family | Candidate content |
| --- | --- | --- |
| D12 | Financial | Purchase/bet insufficient, bet/win limit, balance-update error/server balance change, debit confirmation, deposit/currency info/transaction error |
| D13 | Bonus | Available/entry/end/extra free spins or respins/type selection/purchase/confirm/cancel/results/level/unlock/jackpot/max win |
| D14 | Gift lifecycle | New/received/activation confirmation/active/end/expired/unavailable/all spins used/reward/conflict with current mode |
| D15 | Selection/navigation | Language/audio/history/replay/quit confirmation/mode change |
| D16 | Runtime errors | Unknown/server/network/disconnect/reconnect/timeout/auth/session expiry/unavailable/maintenance/resource failure/version mismatch/update/malformed response/unrecoverable round/another tab/config error/reconnected/processing/unknown command outcome |
| D17 | Events/rewards | Tournament start/end/reward/rank change/new event/end/daily reward/available reward/achievement/level/task completion |
| D18 | Gamble/mini-games | Offer/entry/rules/risk selection/result/loss/end/mini-game offer/start/object selection/result/end |

## Reusable shell contract (engineering recommendations)

Record title/body/icon/illustration/status/data sections/action labels and intent,
blocking scope, dismissibility, loading/error state, focus entry/return, keyboard
handling, and responsive behavior. A Close icon, backdrop tap, Back, and Escape
must follow the same dismiss policy. A pending purchase may allow dismissal of its
surface while retaining the transaction lock and pending status elsewhere.

Define project priority among critical failures, pending financial operations,
required feature transitions, user-opened panels, and promotional notices. This
list is a decision prompt, not a mandated order. Avoid mutually blocking dialogs
or hiding the only recovery/stop action. Queue or replace notices deliberately.
Closing a shell does not complete a transaction, award a gift, or finish a bonus.

Do not expose raw server traces to players. Provide actionable copy supported by
known state, without promising a refund, a success, or a safe retry without evidence.
