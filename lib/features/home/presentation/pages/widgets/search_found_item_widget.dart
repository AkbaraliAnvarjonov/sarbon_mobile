import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../core/extension/extension.dart';
import '../../bloc/home_bloc.dart';

class SearchFoundItemWidget extends StatelessWidget {
  const SearchFoundItemWidget({
    super.key,
    required this.item,
    required this.isForInitialPointOfAddress,
  });

  final bool isForInitialPointOfAddress;
  final SearchItem? item;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          isForInitialPointOfAddress
              ? context.read<HomeBloc>().add(
                    SelectInitialAddressesEvent(
                      address: item?.name ?? '',
                    ),
                  )
              : context.read<HomeBloc>().add(
                    SelectFinalAddressesEvent(
                      address: item?.name ?? '',
                    ),
                  );
          context.pop();
        },
        title: RichText(
          text: TextSpan(
            text: item?.name ?? '',
            children: [
              TextSpan(
                text: ' ${item?.name ?? ''}',
                style: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.triarity,
                ),
              ),
            ],
            style: context.textStyle.regularSubheadline,
          ),
        ),
        leading: Icon(
          Icons.location_on_outlined,
          color: context.color.greyText,
        ),
      );
}
