part of '../splash_page.dart';

mixin SplashMixin on State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if (!context.mounted) return;
    // ignore: discarded_futures
    RemoteConfigService.isCallCheckAppVersion(context).then(
      (value) async {
        if (value.$1 != AppUpdate.none) {
          await appUpdateBottomSheet(
            isForceUpdate: value.$1 == AppUpdate.forceUpdate,
          ).then((value) => nextToNavigation());
        } else {
          nextToNavigation();
        }
      },
    );
  }

  void nextToNavigation() {
    if (!context.mounted) return;
    if (!localSource.hasProfile && !localSource.firstTime) {
      context.pushReplacement(Routes.onBoarding);
    } else if (!localSource.hasProfile && localSource.firstTime) {
      context.pushReplacement(Routes.selectAuth);
    } else {
      context.goNamed(Routes.main);
    }
    return;
  }

  Future<void> appUpdateBottomSheet({
    required bool isForceUpdate,
  }) async {
    await customModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_, controller) => AppUpdateBottomSheetWidget(
        isForceUpdate: isForceUpdate,
        onTap: () async {
          await launchUrl(
            Uri.parse(Constants.appLink),
            mode: LaunchMode.externalApplication,
          ).then(
            (value) async {
              if (!context.mounted) return;
              nextToNavigation();
            },
          );
        },
      ),
    );
  }
}
