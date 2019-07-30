import 'package:flutter/material.dart';

enum VisibilityFlag {
  visible,
  invisible,
  offscreen,
  gone,
}

enum MoreArrowEnum{
  MoreUpOnly,
  MoreDownOnly,
  MoreUpAndDown,
  None
}

class VisibilityHelper extends StatelessWidget {
  final VisibilityFlag visibility;
  final Widget child;
  final Widget removedChild;

  static Icon arrowUp = Icon(
    Icons.keyboard_arrow_up,
    color: Colors.brown,
  );
  static Icon arrowDown = Icon(
    Icons.keyboard_arrow_down,
    color: Colors.brown,
  );

  VisibilityHelper({
    @required this.child,
    @required this.visibility,
  }) : this.removedChild = Container();

  @override
  Widget build(BuildContext context) {
    if (visibility == VisibilityFlag.visible) {
      return child;
    } else if (visibility == VisibilityFlag.invisible) {
      return new IgnorePointer(
        ignoring: true,
        child: new Opacity(
          opacity: 0.0,
          child: child,
        ),
      );
    } else if (visibility == VisibilityFlag.offscreen) {
      return new Offstage(
        offstage: true,
        child: child,
      );
    } else {
      // If gone, we replace child with a custom widget (defaulting to a
      // [Container] with no defined size).
      return removedChild;
    }
  }
}