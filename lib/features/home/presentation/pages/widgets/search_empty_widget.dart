import 'package:flutter/cupertino.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'По вашему поиску ничего\nне найдено',
        textAlign: TextAlign.center,
        style: context.textStyle.regularHeadline,
      ),
      AppUtils.kGap4,
      Text(
        'Попробуйте изменить данные и\nзаново поискать',
        textAlign: TextAlign.center,
        style: context.textStyle.size14Weight400Black.copyWith(
          color: context.color.greyText,
        ),
      ),
    ],
  );
}
