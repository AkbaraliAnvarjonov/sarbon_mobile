import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../bloc/my_cars/add_car/add_car_bloc.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final PageController pageController;
  final VoidCallback onTap;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.pageController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => GestureDetector(
            onTap: () async {
              if (index < pageController.page!.toInt() && index != pageController.page) {
                context.read<AddCarBloc>().add(ChangePage(pageNumber: index));
                await pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                onTap.call();
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: MediaQuery.of(context).size.width / 4 - 16,
              height: 4,
              decoration: BoxDecoration(
                color: currentPage == index ? context.colorScheme.primary : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      );
}
