import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/theme/themes.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../router/app_routes.dart';
import '../../../../bloc/annnouncemant/announcement_bloc.dart';
import 'widgets/announcement_cars_widget.dart';

part '../../mixins/my_announcement_mixin.dart';

part 'announcement_tab_pages/archive_page.dart';

part 'announcement_tab_pages/published_page.dart';

part 'widgets/announcement_app_bar.dart';

class MyAnnouncementPage extends StatefulWidget {
  const MyAnnouncementPage({super.key});

  @override
  State<MyAnnouncementPage> createState() => _MyAnnouncementPageState();
}

class _MyAnnouncementPageState extends State<MyAnnouncementPage>
    with MyAnnouncementMixin, TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initControllers(this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 64),
          child: _MyAnnouncementAppBar(tabController: _tabController),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            _PublishedTabPage(),
            _ArchiveTabPage(),
          ],
        ),
      );
}
