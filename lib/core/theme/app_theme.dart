import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  static const Color accent = Color(0xFF4F46E5);
  static const Color accentLight = Color(0xFF818CF8);
  static const Color accentDark = Color(0xFF3730A3);

  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF111827);
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF030712);

  static const Color textPrimaryLight = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);

  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF1F2937);

  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1F2937);
}

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final textTheme = _buildTextTheme(Brightness.light);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accent,
        secondary: AppColors.accentLight,
        surface: AppColors.surfaceLight,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimaryLight,
        outline: AppColors.borderLight,
      ),
      textTheme: textTheme,
      cardTheme: CardThemeData(
        color: AppColors.cardLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.borderLight, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLight,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData dark() {
    final textTheme = _buildTextTheme(Brightness.dark);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentLight,
        secondary: AppColors.accent,
        surface: AppColors.surfaceDark,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimaryDark,
        outline: AppColors.borderDark,
      ),
      textTheme: textTheme,
      cardTheme: CardThemeData(
        color: AppColors.cardDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.borderDark, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderDark,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static TextTheme _buildTextTheme(Brightness brightness) {
    final bodyFont = GoogleFonts.inter();
    final headingFont = GoogleFonts.inter();

    final base = TextTheme(
      displayLarge: headingFont.copyWith(fontSize: 48, fontWeight: FontWeight.w800, letterSpacing: -1.5),
      displayMedium: headingFont.copyWith(fontSize: 36, fontWeight: FontWeight.w700, letterSpacing: -1),
      displaySmall: headingFont.copyWith(fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: -0.5),
      headlineMedium: headingFont.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
      headlineSmall: headingFont.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
      titleLarge: headingFont.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
      titleMedium: headingFont.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: headingFont.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      bodyLarge: bodyFont.copyWith(fontSize: 16, fontWeight: FontWeight.w400, height: 1.6),
      bodyMedium: bodyFont.copyWith(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
      bodySmall: bodyFont.copyWith(fontSize: 12, fontWeight: FontWeight.w400, height: 1.4),
      labelLarge: bodyFont.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: bodyFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
      labelSmall: bodyFont.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
    );

    if (brightness == Brightness.dark) {
      return base.copyWith(
        bodyLarge: base.bodyLarge?.copyWith(color: AppColors.textPrimaryDark),
        bodyMedium: base.bodyMedium?.copyWith(color: AppColors.textSecondaryDark),
        bodySmall: base.bodySmall?.copyWith(color: AppColors.textSecondaryDark),
      );
    }
    return base.copyWith(
      bodyLarge: base.bodyLarge?.copyWith(color: AppColors.textPrimaryLight),
      bodyMedium: base.bodyMedium?.copyWith(color: AppColors.textSecondaryLight),
      bodySmall: base.bodySmall?.copyWith(color: AppColors.textSecondaryLight),
    );
  }
}
