import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';
import 'package:task_list/core/constants/strings.constant.dart';

class NoTaskListed extends StatelessWidget {
  final VoidCallback onTap;

  const NoTaskListed({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          Image.asset(
            'assets/images/no_task.png',
            height: 82,
            width: 80,
          ),
          Text(
            Strings.noTaskListedDescription,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: CustomColors.slateBlue,
            ),
          ),
          ElevatedButton.icon(
            onPressed: onTap,
            icon: Icon(Icons.add),
            label: Text(
              Strings.noTaskListedButtonLabel,
              style: TextStyle(
                color: CustomColors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  CustomColors.blue.withValues(alpha: .1)),
              iconColor: WidgetStateProperty.all(CustomColors.blue),
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
