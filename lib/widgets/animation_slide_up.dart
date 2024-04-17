import 'package:flutter/material.dart';

class AnimationSlideUp extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const AnimationSlideUp({
    super.key,
    required this.child,
    required this.duration,
  });

  AnimationSlideUp.withDuration(
    int duration, {
    super.key,
    required this.child,
  }) : duration = Duration(milliseconds: duration);

  @override
  State<AnimationSlideUp> createState() => _AnimationSlideUpState();
}

class _AnimationSlideUpState extends State<AnimationSlideUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant AnimationSlideUp oldWidget) {
    super.didUpdateWidget(oldWidget);

    // force restart animation when widget changes
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (ctx, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
