import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14,
      children: [
        Text(
          'John',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: CustomColors.slatePurple,
          ),
        ),
        CircleAvatar(
          radius: 21,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
      ],
    );
  }
}
