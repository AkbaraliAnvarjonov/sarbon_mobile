part of '../calculator_page.dart';

class _AdditionalAddressWidget extends StatelessWidget {
  const _AdditionalAddressWidget();

  @override
  Widget build(BuildContext context) => BlocBuilder<CalculatorBloc, CalculatorState>(
        buildWhen: (previous, current) => previous.addAdditionalAddresses != current.addAdditionalAddresses,
        builder: (context, state) => SliverList.separated(
          itemCount: state.addAdditionalAddresses.length,
          itemBuilder: (_, index) => ListTile(
            trailing: GestureDetector(
              onTap: () {
                context.read<CalculatorBloc>().add(
                      RemoveAdditionalAddressEvent(
                        addressIndex: index,
                      ),
                    );
              },
              child: Icon(
                Icons.close,
                color: context.color.greyText,
              ),
            ),
            title: Text(
              'add_point'.tr(),
              style: context.textStyle.regularFootnote.copyWith(
                color: context.color.greyText,
              ),
            ),
            subtitle: Text(
              state.addAdditionalAddresses[index].name,
              style: context.textStyle.regularCallout,
            ),
            onTap: () {},
          ),
          separatorBuilder: (_, index) => AppUtils.kPad12Divider,
        ),
      );
}
