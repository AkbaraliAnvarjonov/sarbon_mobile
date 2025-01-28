import 'package:flutter/material.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  final VoidCallback onTerminate;

  AppLifecycleObserver(this.onTerminate);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      onTerminate();
    }
  }
}
