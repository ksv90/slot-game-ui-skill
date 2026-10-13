# Layout, input, localization, accessibility

Engineering recommendations; selected platforms, dimensions, and acceptance targets
are project decisions. This reference does not certify regulatory conformance.

## Responsive composition

- Plan only supported desktop/mobile, portrait/landscape, embedded/fullscreen
  modes. Preserve semantic elements across layouts; moving a control into a menu
  should not change its state, value, command, or selection.
- Keep selected primary controls and critical balance/bet/win information readable.
  Choose stacking, grouping, drawers, and breakpoints from real content and
  approved references rather than assuming one universal bottom control bar.
- Account for safe areas, host overlays, aspect ratio, viewport changes, small
  heights, and virtual keyboard. Scroll dialog content when necessary; keep its
  action and close path reachable. Overlay priority remains consistent.
- Orientation/fullscreen changes reflow presentation without recreating a pending
  wager, resetting a bonus, losing a quote, or restarting autoplay.
- If an unsupported orientation needs a rotate prompt, define whether gameplay
  continues behind it and preserve the same round and action guards on return.
- On focus loss, backgrounding, or return to a tab, restore the presented state
  from the game/session contract rather than treating a stale screen as ready.
- Inspect long numbers, multiple currency symbols, negative/zero values where
  applicable, long localized strings, and enlarged text. Distinguish a truncated
  label from a materially truncated amount.

## Inputs and focus

- Treat pointer, touch, keyboard, and gesture as alternative input sources for
  one semantic intent. Prevent duplicate activation and click-through when
  Spin becomes Skip or a dialog closes. Do not require hover on touch devices.
- Enable Space/hold/swipe only when selected. Exclude shortcuts during text entry
  and conflicting focus, suppress unwanted key-repeat, and use the same guards
  as pointer activation. Hold behavior and cancellation threshold are decisions.
- Give icon-only controls meaningful names and communicate disabled/pressed/
  expanded states in the renderer's supported accessibility layer.
- For modal windows use appropriate focus entry, containment, reachable dismissal
  when allowed, and return to a valid trigger. Do not trap focus in an overlay
  without an available action or meaningful wait status.
- Fullscreen state follows platform events. Handle unsupported or denied requests
  and external fullscreen exit. Audio activation may need a user gesture on the
  target platform; follow its actual API.

## Information and motion

- Do not rely solely on color, icon shape, sound, or animation to convey a critical
  unavailable, pending, success, or failure state. Clarify what an action does.
- Where supported, respect reduced-motion preferences or selected settings while
  preserving outcomes, counters, required transitions, and final amounts.
- Announce meaningful status changes where accessibility tooling exists; avoid
  reading every tick of a rapidly changing win, jackpot, or progress counter.
- Define contrast and target sizes using the project's chosen standard; do not
  invent numeric rules or claim compliance from visual inspection alone.

## Localization and QA

Use the game's currency/credit precision and locale formatting; do not silently
convert units. Record timezones for history and event timers. Select plural forms
for counters and localized labels for actions. Right-to-left layout is required
only if supported languages need it. Runtime language changes preserve state.
Dynamic messages and tooltips need the same localization and readable-length
checks as persistent controls; adapt fonts where the actual language set needs it.

Capture representative screenshots or inspect actual rendered views where possible.
Static layout checks do not establish command guards, recovery, or focus behavior.
If the platform lacks accessibility bridging, document the limitation rather than
pretending HTML semantics apply to every canvas or native renderer.
