import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';

class TaskiLogo extends StatelessWidget {
  const TaskiLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Transform.scale(
          scale: 1.8,
          child: Checkbox(
            value: true,
            onChanged: null,
            fillColor: WidgetStateProperty.all(CustomColors.blue),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Text(
          'Taski',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: CustomColors.slatePurple,
          ),
        ),
      ],
    );
  }
}
