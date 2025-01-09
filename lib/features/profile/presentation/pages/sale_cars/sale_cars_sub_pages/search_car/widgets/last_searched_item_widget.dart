part of '../search_car_page.dart';

class _LastSearchedItemWidget extends StatelessWidget {
  const _LastSearchedItemWidget({
    required this.onTap,
    required this.saleBloc,
    required this.searchSavedList,
  });

  final ValueChanged<String> onTap;
  final SaleCarBloc saleBloc;
  final List<String> searchSavedList;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: AppUtils.kPaddingAll16,
                child: Text(
                  'recently_searched'.tr(),
                  style: context.textStyle.size15Weight500Black,
                ),
              ),
            ),
            SliverList.separated(
              itemBuilder: (_, index) => ListTile(
                onTap: () {
                  onTap.call(searchSavedList[index]);
                },
                title: Text(
                  searchSavedList[index],
                  style: context.textStyle.regularBody,
                ),
                trailing: IconButton(
                  onPressed: () {
                    saleBloc.add(
                      DeleteItemSearchSavedListEvent(
                        index: index,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.close,
                    color: context.color.lightGray,
                  ),
                ),
              ),
              separatorBuilder: (_, index) => AppUtils.kDivider,
              itemCount: searchSavedList.length,
            ),
          ],
        ),
      );
}
