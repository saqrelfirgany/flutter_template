# Flow Radial Menu

Demonstrates `Flow` — the low-level layout widget that sits underneath `Stack`,
`Wrap`, and friends but is almost never reached for directly. A single
`FlowDelegate` fans four `FloatingActionButton`s out along a circular arc
around a central toggle.

**The surprising part:** `Flow` lays its children out exactly once, then
animates purely by repainting a `Matrix4` transform per child on every frame
— no relayout, no `Stack` + `AnimatedPositioned` per button. `shouldRepaint`
plus `FlowDelegate(repaint: animation)` means the whole fan-out redraws
without ever touching `setState`.

**Drop-in:** copy `flow_radial_menu_demo.dart` into a feature folder and place
`FlowRadialMenuDemo()` anywhere a widget fits — it manages its own
`AnimationController` and has no external dependencies.
