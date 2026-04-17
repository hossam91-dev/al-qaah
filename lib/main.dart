import 'package:al_qaah/features/design_system/presentation/pages/design_system_page.dart';
import 'package:al_qaah/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Qaah',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const DesignSystemPage(),
    );
  }
}
