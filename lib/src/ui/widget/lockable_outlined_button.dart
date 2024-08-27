import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LockableOutlinedButton extends StatefulWidget {
  final AsyncCallback? onPressed;
  final AsyncCallback? onLongPress;
  final ButtonStyle? style;
  final Widget? child;
  final Widget? lockedChild;
  final Widget? icon;
  final Widget? lockedIcon;
  final Widget? label;
  final Widget? lockedLabel;

  const LockableOutlinedButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.style,
    required Widget this.child,
    this.lockedChild,
  })  : icon = null,
        lockedIcon = null,
        label = null,
        lockedLabel = null;

  const LockableOutlinedButton.icon({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.style,
    required Widget this.icon,
    this.lockedIcon,
    required Widget this.label,
    this.lockedLabel,
  })  : child = null,
        lockedChild = null;

  @override
  State<StatefulWidget> createState() => _LockableOutlinedButtonState();
}

class _LockableOutlinedButtonState extends State<LockableOutlinedButton> {
  bool locked = false;

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return OutlinedButton(
        style: widget.style,
        onPressed: locked || widget.onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                widget.onPressed!().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || widget.onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                widget.onLongPress!().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        child: locked ? widget.lockedChild ?? widget.child : widget.child,
      );
    } else if (widget.icon != null && widget.label != null) {
      return OutlinedButton.icon(
        style: widget.style,
        onPressed: locked || widget.onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                widget.onPressed!().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || widget.onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                widget.onLongPress!().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        icon: locked ? widget.lockedIcon ?? widget.icon! : widget.icon!,
        label: locked ? widget.lockedLabel ?? widget.label! : widget.label!,
      );
    } else {
      throw UnimplementedError("Invalid 'LockableOutlinedButton' instance");
    }
  }
}
