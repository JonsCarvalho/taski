import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';
import 'package:task_list/core/shared/ui/widgets/bottom_bar/custom_bottom_bar.controller.dart';

import 'custom_bottom_bar.widget.dart';

class CustomBottomBarItem extends StatelessWidget {
  final CustomBottomBarItemModel item;
  final CustomBottomBarController controller;
  final int index;

  const CustomBottomBarItem({
    super.key,
    required this.item,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.red,
      highlightColor: Colors.green,
      onTap: () {
        controller.setSelectedIndex(index);
        if (item.onTap != null) item.onTap!();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Icon(
            item.icon,
            color: controller.selectedIndex == index
                ? CustomColors.blue
                : CustomColors.mutedAzure,
            size: 28,
          ),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: controller.selectedIndex == index
                  ? CustomColors.blue
                  : CustomColors.mutedAzure,
            ),
          ),
        ],
      ),
    );
  }
}
