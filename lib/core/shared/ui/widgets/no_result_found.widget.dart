import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';
import 'package:task_list/core/constants/strings.constant.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({super.key});

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
            Strings.noResultFoundDescription,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: CustomColors.slateBlue,
            ),
          ),
        ],
      ),
    );
  }
}
