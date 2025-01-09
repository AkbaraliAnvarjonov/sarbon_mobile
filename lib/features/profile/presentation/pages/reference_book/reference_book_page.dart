import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../bloc/reference_book/reference_book_bloc.dart';

part 'widgets/reference_items_widget.dart';

class ReferenceBookPage extends StatelessWidget {
  const ReferenceBookPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('reference_book'.tr()),
        ),
        body: BlocBuilder<ReferenceBookBloc, ReferenceBookState>(
          buildWhen: (previous, current) =>
              previous.fetchReferenceBookStatus !=
              current.fetchReferenceBookStatus,
          builder: (context, state) => ModalProgressHUD(
            inAsyncCall: state.fetchReferenceBookStatus.isLoading,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: AppUtils.kPaddingAll16,
                  sliver: SliverList.separated(
                    itemCount: state.referenceBook.length,
                    itemBuilder: (_, index) => _ReferenceItemsWidget(
                      title: state.referenceBook[index].title ?? '',
                      description: state.referenceBook[index].description ?? '',
                    ),
                    separatorBuilder: (_, index) => AppUtils.kDivider,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
