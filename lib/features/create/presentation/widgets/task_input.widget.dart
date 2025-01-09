import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';

class TaskInput extends StatelessWidget {
  final String hint;
  final Function(String)? onChanged;

  const TaskInput({
    super.key,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CustomColors.blue,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: CustomColors.mutedAzure,
        ),
        border: InputBorder.none,
      ),
      onChanged: onChanged,
    );
  }
}
