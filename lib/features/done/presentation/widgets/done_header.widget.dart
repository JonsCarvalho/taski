import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';
import 'package:task_list/core/constants/strings.constant.dart';

class DoneHeader extends StatelessWidget {
  final VoidCallback onDelete;

  const DoneHeader({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Strings.doneHeaderTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: CustomColors.slatePurple,
          ),
        ),
        TextButton(
          onPressed: onDelete,
          child: Text(
            Strings.doneHeaderDeleteButtonLabel,
            style: TextStyle(
              fontSize: 18,
              color: CustomColors.fireRed,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
