import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';

class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: TColors.textPrimary),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: TColors.textPrimary),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: TColors.textPrimary),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: TColors.textPrimary),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: TColors.textSecondary),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: TColors.textSecondary),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: TColors.textPrimary),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: TColors.textPrimary),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: TColors.textSecondary),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: TColors.textPrimary),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: TColors.textSecondary),
  );
}

class TTexts {
  static const String homeAppbarTitle = "Freelancer";
  static const String homeAppbarSubTitle = "Kareem Abusamra";
}
