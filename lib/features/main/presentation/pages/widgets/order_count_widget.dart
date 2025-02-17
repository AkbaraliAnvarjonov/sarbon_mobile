import 'package:flutter/material.dart';

class OrderCountBadge extends StatefulWidget {
  final int count;

  const OrderCountBadge({Key? key, required this.count}) : super(key: key);

  @override
  _OrderCountBadgeState createState() => _OrderCountBadgeState();
}

class _OrderCountBadgeState extends State<OrderCountBadge> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800), // Total time including pauses
      vsync: this,
    );

    _animation = TweenSequence<Offset>([
      // First jump
      TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0, -0.8), // Jump up
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 20),
      TweenSequenceItem(
          tween: ConstantTween(const Offset(0, -0.8)), // Pause at the top
          weight: 10),
      TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, -0.8),
            end: const Offset(0, 0), // Back down
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 20),
      TweenSequenceItem(
          tween: ConstantTween(const Offset(0, 0)), // Pause at the bottom (300ms)
          weight: 10),

      // Second jump
      TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0, -0.8), // Jump again
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 20),
      TweenSequenceItem(
          tween: ConstantTween(const Offset(0, -0.8)), // Pause at the top
          weight: 10),
      TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, -0.8),
            end: const Offset(0, 0), // Back down
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 20),
      TweenSequenceItem(
          tween: ConstantTween(const Offset(0, 0)), // Pause at the bottom (300ms)
          weight: 10),

      // Third jump
      TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0, -0.8), // Last jump
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 20),
      TweenSequenceItem(
          tween: ConstantTween(const Offset(0, -0.8)), // Pause at the top
          weight: 10),
      TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, -0.8),
            end: const Offset(0, 0), // Finally settle
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 20),
    ]).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.count > 0) {
        Future.delayed(const Duration(seconds: 2), () {
          _controller.forward();
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant OrderCountBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.count > 0 && oldWidget.count == 0) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: 14,
          height: 14,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              widget.count.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
