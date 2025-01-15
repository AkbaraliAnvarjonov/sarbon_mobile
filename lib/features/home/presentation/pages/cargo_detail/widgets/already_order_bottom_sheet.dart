import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../main/presentation/bloc/main_bloc.dart';

class AlreadyOrderBottomSheet extends StatelessWidget {
  const AlreadyOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHorizontal24,
        child: Column(
          children: [
            AppUtils.kGap12,
            SvgPicture.asset(SvgImage.warningOrder),
            AppUtils.kGap12,
            Text(
              'У вас уже есть\nактивный заказ',
              style: context.textStyle.size15Weight600Black.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap12,
            Text(
              "Пожалуйста, завершите текущий заказ или отмените его в разделе 'Заказы', чтобы предложить свои услуги для другого груза",
              style: context.textStyle.size14Weight400Black,
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap20,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {
                context.pop();
              },
              child: const Text('Хорошо'),
            ),
            AppUtils.kGap8,
            SafeArea(
              child: TextButton(
                  onPressed: () {
                    context
                      ..read<MainBloc>().add(const MainEventChanged(BottomMenu.orders))
                      ..pop()
                      ..pop();
                  },
                  child: const Text('Перейти в заказы')),
            ),
          ],
        ),
      );
}
