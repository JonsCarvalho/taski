import 'package:flutter/material.dart';
import 'package:task_list/core/constants/strings.constant.dart';
import 'package:task_list/core/shared/utils/page_transition.dart';
import 'package:task_list/features/home/presentation/pages/home.page.dart';

import 'core/constants/custom_colors.constant.dart';
import 'core/injections/app_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInjections.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          },
        ),
        scaffoldBackgroundColor: CustomColors.white,
        useMaterial3: true,
        fontFamily: 'Urbanist',
        unselectedWidgetColor: CustomColors.mutedAzure,
        checkboxTheme: CheckboxThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return CustomColors.mutedAzure;
            }
            if (states.contains(WidgetState.selected)) {
              return CustomColors.blue;
            }

            return Colors.transparent;
          }),
          side: BorderSide(
            color: CustomColors.mutedAzure,
            width: 2,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
      home: const HomePage(),
    );
  }
}
