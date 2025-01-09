import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/icons_constants.dart';
import '../../extension/extension.dart';
import '../../utils/utils.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgImage.searchEmpty,
              width: 64,
              height: 64,
            ),
            AppUtils.kGap16,
            Text(
              'Ничего не найдено',
              style: context.textStyle.bodyHeadline.copyWith(
                color: context.color.textColor,
              ),
            ),
            AppUtils.kGap8,
            Text(
              'Попробуйте изменить параметры поиска',
              style: context.textStyle.regularFootnote.copyWith(
                color: context.color.textColor,
              ),
            ),
            AppUtils.kGap24,
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Вернуться обратно'),
            ),
          ],
        ),
      );
}
