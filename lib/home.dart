import 'package:flutter/material.dart';
import 'profile/presentation/profile.dart';
import 'core/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asser Mohammed — Flutter Developer',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const ProfileScreen(),
    );
  }
}
