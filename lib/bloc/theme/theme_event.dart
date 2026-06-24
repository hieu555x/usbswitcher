import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final ThemeMode themeMode;

  ThemeChanged(this.themeMode);
}

class ThemeToggle extends ThemeEvent {}

class UsbStatusChanged extends ThemeEvent {
  final bool isUsbEnabled;

  UsbStatusChanged(this.isUsbEnabled);
}

class ThemeModeUpdated extends ThemeEvent {
  final ThemeMode themeMode;

  ThemeModeUpdated(this.themeMode);
}
