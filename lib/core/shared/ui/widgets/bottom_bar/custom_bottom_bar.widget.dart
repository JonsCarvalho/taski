import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';
import 'package:task_list/core/shared/ui/widgets/bottom_bar/custom_bottom_bar_item.widget.dart';

import 'custom_bottom_bar.controller.dart';

class CustomBottomBar extends StatelessWidget {
  final List<CustomBottomBarItemModel> items;
  final CustomBottomBarController controller;

  const CustomBottomBar({
    super.key,
    required this.items,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          height: 100,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: CustomColors.white,
            border: Border(
              top: BorderSide(
                color: CustomColors.paleWhite,
                width: 2,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: CustomColors.white.withAlpha(150),
                blurRadius: 40,
                offset: const Offset(0, -60),
                spreadRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              items.length,
              (index) => CustomBottomBarItem(
                item: items[index],
                controller: controller,
                index: index,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomBottomBarItemModel {
  final IconData icon;
  final String label;
  final void Function()? onTap;

  CustomBottomBarItemModel({
    required this.icon,
    required this.label,
    this.onTap,
  });
}
