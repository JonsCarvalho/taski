import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';
import 'package:task_list/core/constants/strings.constant.dart';
import 'package:task_list/features/create/presentation/widgets/task_input.widget.dart';

import '../controllers/create_task_bottom_sheet.controller.dart';

class CreateTaskBottomSheet {
  Future<dynamic> show(context) async {
    await Future.delayed(Duration(milliseconds: 250));

    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: CustomColors.white,
      builder: (_) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: CreateTaskBottomSheetContent(),
        );
      },
    );
  }
}

class CreateTaskBottomSheetContent extends StatelessWidget {
  const CreateTaskBottomSheetContent({super.key});

  static final CreateTaskBottomSheetController controller =
      GetIt.I.get<CreateTaskBottomSheetController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 42, vertical: 34),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                spacing: 16,
                children: [
                  Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      value: controller.completed,
                      onChanged: controller.setCompleted,
                    ),
                  ),
                  Expanded(
                    child: TaskInput(
                      hint: Strings.bottomSheetCreateTaskTitleLabel,
                      onChanged: controller.setTitle,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                spacing: 24,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Transform.scale(
                      scale: 1.4,
                      child: Icon(
                        Icons.edit,
                        color: CustomColors.mutedAzure,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TaskInput(
                      hint: Strings.bottomSheetCreateTaskNoteLabel,
                      onChanged: controller.setContent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    controller.onCreateTask();
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    Strings.bottomSheetCreateTaskButton,
                    style: TextStyle(
                      color: CustomColors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
