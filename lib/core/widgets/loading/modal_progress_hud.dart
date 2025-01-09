import 'dart:ui';

import 'package:flutter/material.dart';

import '../../extension/extension.dart';

class ModalProgressHUD extends StatelessWidget {
  const ModalProgressHUD({
    super.key,
    this.inAsyncCall = false,
    this.opacity = 0.3,
    this.color = Colors.transparent,
    this.progressIndicator = const CircularProgressIndicator.adaptive(),
    this.offset,
    this.dismissible = false,
    required this.child,
  });

  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned.fill(child: child),
      if (inAsyncCall) ...[
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.decal,
                  colors: [
                    context.colorScheme.surface.withOpacity(0.05),
                    context.colorScheme.surface.withOpacity(0.1),
                    context.colorScheme.surface.withOpacity(0.05),
                  ],
                ),
              ),
              child: const ModalBarrier(
                dismissible: false,
              ),
            ),
          ),
        ),
        Center(child: progressIndicator),
      ],
    ],
  );
}
