import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../bloc/user_agreement/user_agreement_bloc.dart';

class UserAgreementPage extends StatelessWidget {
  const UserAgreementPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('user_agreement'.tr()),
        ),
        body: BlocBuilder<UserAgreementBloc, UserAgreementState>(
          builder: (context, state) => ModalProgressHUD(
            inAsyncCall: state.userAgreementStatus.isLoading,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: HtmlWidget(
                      state.userAgreement,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
