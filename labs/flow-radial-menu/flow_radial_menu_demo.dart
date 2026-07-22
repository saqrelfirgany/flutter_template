import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A radial action menu built on the low-level [Flow] widget instead of a
/// [Stack] of [AnimatedPositioned]s. [Flow] lays every child out exactly
/// once, then repositions them each frame purely by repainting a transform
/// matrix per child — so fanning four buttons around a circle costs one
/// paint pass, not four separate relayouts.
class FlowRadialMenuDemo extends StatefulWidget {
  const FlowRadialMenuDemo({super.key});

  @override
  State<FlowRadialMenuDemo> createState() => _FlowRadialMenuDemoState();
}

class _FlowRadialMenuDemoState extends State<FlowRadialMenuDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 260),
  );

  static const _actions = <IconData>[
    Icons.share,
    Icons.favorite,
    Icons.bookmark,
    Icons.download,
  ];

  void _toggle() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 240,
        height: 240,
        child: Flow(
          delegate: _RadialFlowDelegate(animation: _controller),
          children: [
            for (var i = 0; i < _actions.length; i++)
              FloatingActionButton.small(
                heroTag: 'flow-radial-action-$i',
                onPressed: () {},
                child: Icon(_actions[i]),
              ),
            FloatingActionButton(
              key: const Key('radial-toggle'),
              heroTag: 'flow-radial-toggle',
              onPressed: _toggle,
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadialFlowDelegate extends FlowDelegate {
  _RadialFlowDelegate({required this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) =>
      BoxConstraints.loose(constraints.biggest);

  @override
  void paintChildren(FlowPaintingContext context) {
    final center = Offset(context.size.width / 2, context.size.height / 2);
    final actionCount = context.childCount - 1;
    final radius = 90 * Curves.easeOutBack.transform(animation.value);

    for (var i = 0; i < actionCount; i++) {
      final theta = math.pi + (i / (actionCount - 1)) * math.pi;
      final target =
          center + Offset(radius * math.cos(theta), radius * math.sin(theta));
      final childSize = context.getChildSize(i) ?? Size.zero;
      final topLeft = target - Offset(childSize.width / 2, childSize.height / 2);
      context.paintChild(
        i,
        transform: Matrix4.translationValues(topLeft.dx, topLeft.dy, 0),
      );
    }

    final toggleSize = context.getChildSize(actionCount) ?? Size.zero;
    final toggleTopLeft =
        center - Offset(toggleSize.width / 2, toggleSize.height / 2);
    context.paintChild(
      actionCount,
      transform: Matrix4.translationValues(toggleTopLeft.dx, toggleTopLeft.dy, 0),
    );
  }

  @override
  bool shouldRepaint(covariant _RadialFlowDelegate oldDelegate) =>
      oldDelegate.animation != animation;
}
