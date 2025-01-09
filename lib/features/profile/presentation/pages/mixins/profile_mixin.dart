part of '../profile_page.dart';

mixin ProfileMixin {
  late final ScrollController scrollController;

  void initControllers() {
    scrollController = ScrollController();
  }

  void disposeControllers() {
    scrollController.dispose();
  }
}
