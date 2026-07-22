# Labs Backlog

Ideas for tiny, novel/niche Flutter demos. One gets shipped per increment.

## Todo

- **Custom ScrollPhysics carousel snap** — extend `ScrollPhysics` (not `PageView`) so a horizontal list settles on the nearest card via a spring simulation, with drag velocity feeding into where it lands.
- **Sealed-class state machine UI** — model a network request (`Idle | Loading | Success | Failure`) as a Dart 3 sealed class and exhaustively pattern-match it straight inside `build()`, no `if`/`is`-chains.
- **CustomMultiChildLayout dashboard** — lay out a fixed hero-plus-two-side-tiles dashboard with a single `CustomMultiChildLayout` delegate instead of nested `Row`/`Column`/`Expanded`.
- **Gesture arena tug-of-war** — two overlapping recognizers on the same pixel (tap vs. long-press) with a live log panel showing how Flutter's gesture arena picks a winner.
- **ImageFiltered frosted reveal** — scrub a slider to blend a sharp and a `ImageFiltered`-blurred version of the same subtree via `Opacity` cross-fade, no images or shader packages needed.

## Done

- **Flow radial menu** (2026-07-22) — a low-level `Flow` widget + custom `FlowDelegate` fans FAB actions out along a circular arc, animating purely through repainted transform matrices instead of `AnimatedPositioned`/`Stack`.
