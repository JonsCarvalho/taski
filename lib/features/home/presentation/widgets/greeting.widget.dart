import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';

class Greeting extends StatelessWidget {
  final int tasksToDo;

  const Greeting({super.key, required this.tasksToDo});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: CustomColors.slatePurple,
            ),
            children: [
              TextSpan(
                text: 'Welcome, ',
              ),
              TextSpan(
                text: 'John',
                style: TextStyle(color: CustomColors.blue),
              ),
              TextSpan(
                text: '.',
              ),
            ],
          ),
        ),
        Text(
          'You’ve got $tasksToDo tasks to do.',
          style: TextStyle(
            fontSize: 16,
            color: CustomColors.slateBlue,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
