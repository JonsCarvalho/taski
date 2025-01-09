import 'package:flutter/material.dart';
import 'package:task_list/core/shared/ui/widgets/profile.widget.dart';
import 'package:task_list/core/shared/ui/widgets/taski_logo.widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TaskiLogo(),
        Profile(),
      ],
    );
  }
}
