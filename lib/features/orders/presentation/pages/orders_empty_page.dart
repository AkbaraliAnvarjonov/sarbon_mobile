import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';

class OrdersEmptyPage extends StatelessWidget {
  const OrdersEmptyPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            'empty_orders'.tr(),
            textAlign: TextAlign.center,
            style: context.textStyle.regularCallout,
          ),
        ),
      );
}
