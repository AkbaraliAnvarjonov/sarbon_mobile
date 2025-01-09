part of '../edit_profile_page.dart';

class AddAdditionalInfoWidget extends StatelessWidget {
  const AddAdditionalInfoWidget({
    super.key,
    required this.additionalInfoList,
  });

  final List<String> additionalInfoList;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.color.borderColor,
          ),
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
        ),
        child: Padding(
          padding: AppUtils.kPaddingHorizontal12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppUtils.kGap8,
              Text(
                'Добавить',
                style: context.textStyle.regularFootnote.copyWith(
                  color: context.color.greyText,
                ),
              ),
              AppUtils.kGap4,
              Wrap(
                children: List.generate(
                  additionalInfoList.length,
                  (index) => Padding(
                    padding: AppUtils.kPaddingR8B8,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.color.borderColor,
                        ),
                        borderRadius: AppUtils.kBorderRadius12,
                        color: context.colorScheme.onPrimary,
                      ),
                      child: Padding(
                        padding: AppUtils.kPaddingAll4,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              additionalInfoList[index],
                              style: context.textStyle.size14Weight500Black
                                  .copyWith(
                                color: context.color.gray700,
                              ),
                            ),
                            AppUtils.kGap4,
                            const Icon(
                              Icons.close,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
