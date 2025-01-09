import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';

import 'task_item.controller.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String content;
  final bool checked;
  final VoidCallback? onChecked;
  final VoidCallback? onDelete;
  final bool showTrash;
  final bool disable;
  final String id;

  TaskItem({
    super.key,
    required this.title,
    required this.content,
    required this.checked,
    required this.id,
    this.onChecked,
    this.onDelete,
    this.showTrash = false,
  })  : controller = TaskItemController(),
        disable = onChecked == null;

  final TaskItemController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return ExpansionTile(
          key: Key(id),
          initiallyExpanded: false,
          backgroundColor: CustomColors.paleWhite,
          collapsedBackgroundColor: CustomColors.paleWhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          collapsedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CustomColors.slatePurple,
            ),
          ),
          trailing: disable || showTrash
              ? IconButton(
                  icon: Icon(Icons.delete),
                  color: CustomColors.fireRed,
                  onPressed: () => onDelete?.call(),
                )
              : Icon(Icons.more_horiz, color: CustomColors.mutedAzure),
          showTrailingIcon: disable ? true : !controller.expanded,
          tilePadding: EdgeInsets.all(10),
          visualDensity: VisualDensity.compact,
          onExpansionChanged: controller.setExpanded,
          leading: Transform.scale(
            scale: 1.4,
            child: Checkbox(
              value: checked,
              onChanged: disable ? null : (value) => onChecked?.call(),
            ),
          ),
          childrenPadding: EdgeInsets.only(
            bottom: 16,
            left: 62,
            right: 24,
          ),
          dense: true,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.slateBlue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
