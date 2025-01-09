import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../domain/entities/routes/fetch_routes_entity.dart';
import '../../../../../bloc/route/update_route/update_route_bloc.dart';

class SearchFoundItemRouteUpdatePageWidget extends StatelessWidget {
  const SearchFoundItemRouteUpdatePageWidget({
    super.key,
    required this.item,
    required this.isForInitialPointOfAddress,
  });

  final bool isForInitialPointOfAddress;
  final AddressForRouteEntity? item;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          isForInitialPointOfAddress
              ? context.read<UpdateRouteBloc>().add(
                    SelectInitialAddressesEvent(
                      address: item!,
                    ),
                  )
              : context.read<UpdateRouteBloc>().add(
                    SelectFinalAddressesEvent(
                      address: item!,
                    ),
                  );
          context.pop();
        },
        title: RichText(
          text: TextSpan(
            text: (context.locale.languageCode == 'ru'
                    ? item?.cityNameRu
                    : item?.cityNameEn) ??
                '',
            children: [
              TextSpan(
                text:
                    ' ${(context.locale.languageCode == 'ru' ? item?.addressNameRu : item?.addressNameEn) ?? ''}',
                style: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.triarity,
                ),
              ),
            ],
            style: context.textStyle.regularSubheadline,
          ),
        ),
        leading: Icon(
          Icons.location_on_sharp,
          color: context.color.greyText,
        ),
      );
}
