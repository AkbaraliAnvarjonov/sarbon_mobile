import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';
import 'package:sarbon_mobile/core/utils/utils.dart';

class SelectWidget extends StatelessWidget {
  const SelectWidget({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: isSelected ? context.color.blue : null,
        border: isSelected
            ? null
            : Border.all(
                width: 1,
                color: context.color.grey400,
              ),
        borderRadius: AppUtils.kBorderRadius4,
      ),
      child: isSelected
          ? const Center(
              child: Icon(
              Icons.done_outlined,
              size: 12,
              color: Colors.white,
            ))
          : null,
    );
  }
}
