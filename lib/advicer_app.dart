import 'package:advicer/application/core/services/theme_service.dart';
import 'package:advicer/application/pages/advice/advice_page.dart';
import 'package:advicer/application/pages/employee/employee_page.dart';
import 'package:advicer/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicerApp extends StatelessWidget {
  const AdvicerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const EmployeePage());
    });
  }
}
