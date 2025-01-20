import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

import '../../theme/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final List<Widget>? actions;
  final String title;

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16), // Adjust the radius as needed
            bottomRight: Radius.circular(16),
          ),
          child: AppBar(
            systemOverlayStyle: systemUiOverlayStyle,
            centerTitle: false,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            backgroundColor: context.colorScheme.primary,
            title: Text(
              title,
              style: context.textStyle.appBarTitle.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colorScheme.onPrimary,
              ),
            ),
            actions: actions,
          ),
        ),
      );

  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
