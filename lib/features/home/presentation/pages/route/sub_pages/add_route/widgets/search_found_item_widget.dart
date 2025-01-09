import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../bloc/route/add_route/add_route_bloc.dart';

class SearchFoundItemRoutePageWidget extends StatelessWidget {
  const SearchFoundItemRoutePageWidget({
    super.key,
    required this.item,
    required this.isForInitialPointOfAddress,
  });

  final bool isForInitialPointOfAddress;
  final SearchItem item;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          isForInitialPointOfAddress
              ? context.read<AddRouteBloc>().add(
                    SelectInitialAddressesEvent(address: item),
                  )
              : context.read<AddRouteBloc>().add(
                    SelectFinalAddressesEvent(address: item),
                  );
          context.pop();
        },
        title: Text(
          item.name,
          style: context.textStyle.regularSubheadline,
        ),
        // RichText(
        //   text: TextSpan(
        //     children: [
        //       TextSpan(
        //         text: item.toponymMetadata?.address.formattedAddress ?? '',
        //         style: context.textStyle.regularSubheadline.copyWith(
        //           color: context.color.triarity,
        //         ),
        //       ),
        //     ],
        //     text: item.name,
        //     style: context.textStyle.regularSubheadline,
        //   ),
        // ),

        leading: Icon(
          Icons.location_on_sharp,
          color: context.color.greyText,
        ),
      );
}
