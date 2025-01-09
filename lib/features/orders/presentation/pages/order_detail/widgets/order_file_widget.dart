part of '../order_detail_page.dart';

class _OrderFileWidget extends StatelessWidget {
  const _OrderFileWidget({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Material(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
          child: Padding(
            padding: AppUtils.kPaddingAll12,
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgImage.icFile,
                  width: 42,
                  height: 42,
                ),
                AppUtils.kGap16,
                Expanded(
                  child: Text(
                    name.split('_').last,
                    style: context.textStyle.size15Weight600Black.copyWith(
                      color: context.color.textColor,
                    ),
                  ),
                ),
                // Text(
                //   name.split('_').last,
                //   style: context.textStyle.size15Weight600Black.copyWith(
                //     color: context.color.textColor,
                //   ),
                // ),
                IconButton(
                  onPressed: () async {
                    await UrlLauncher.getUrl(url);
                  },
                  icon: SvgPicture.asset(
                    SvgImage.icDownload,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
