import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class AppUpdateBottomSheetWidget extends StatelessWidget {
  const AppUpdateBottomSheetWidget({
    super.key,
    this.onTap,
    required this.isForceUpdate,
  });

  final void Function()? onTap;
  final bool isForceUpdate;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: SafeArea(
          minimum: AppUtils.kPaddingAll16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'New version',
                textAlign: TextAlign.center,
              ),
              AppUtils.kGap8,
              const Text(
                'Sarbon has become even more convenient',
                textAlign: TextAlign.center,
              ),
              AppUtils.kGap16,
              ElevatedButton(
                onPressed: onTap,
                child: const Text('Update'),
              ),
              if (!isForceUpdate) AppUtils.kGap8,
              if (!isForceUpdate)
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Later'),
                ),
            ],
          ),
        ),
      );
}
