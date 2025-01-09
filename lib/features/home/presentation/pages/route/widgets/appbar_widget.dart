part of '../route_page.dart';

class _AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: true,
        title: Text('route'.tr()),
        actions: [
          IconButton(
            onPressed: () async {
              await customModalBottomSheet<void>(
                context: context,
                builder: (context, controller) => const InfoAboutRoute(),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: () async {
              await context.pushNamed(Routes.addRoute).then(
                (value) {
                  if (value != null && value == true) {
                    if (!context.mounted) return;
                    context.read<RoutesBloc>().add(const FetchRoutesEvent());
                  }
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
