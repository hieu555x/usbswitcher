import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;
  final bool isUsbEnabled;
  final Color? appBarColor;

  const ThemeState({
    required this.themeMode,
    this.isUsbEnabled = false,
    this.appBarColor = Colors.transparent,
  });

  ThemeState copyWith({
    ThemeMode? themeMode,
    bool? isUsbEnabled,
    Color? appBarColor,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isUsbEnabled: isUsbEnabled ?? this.isUsbEnabled,
      appBarColor: appBarColor ?? this.appBarColor,
    );
  }
}
