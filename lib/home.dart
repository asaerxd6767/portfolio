import 'package:flutter/material.dart';
import 'profile/presentation/profile.dart';

import 'constants/Themes/dark_theme.dart';
import 'constants/Themes/light_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _withAppFont(lightMode),
      darkTheme: _withAppFont(darkMode),
      themeMode: ThemeMode.system,
      home: const Scaffold(body: ProfileScreen()),
    );
  }

  ThemeData _withAppFont(ThemeData theme) {
    return theme.copyWith(
      textTheme: theme.textTheme.apply(fontFamily: 'JetBrainsMono'),
      primaryTextTheme: theme.primaryTextTheme.apply(
        fontFamily: 'JetBrainsMono',
      ),
    );
  }
}
