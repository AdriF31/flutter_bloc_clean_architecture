import 'package:advicer/advicer_app.dart';
import 'package:advicer/application/core/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const AdvicerApp(),
  ));
}
