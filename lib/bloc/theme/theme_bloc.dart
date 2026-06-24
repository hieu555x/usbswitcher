import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usbswitcher/bloc/theme/theme_event.dart';
import 'package:usbswitcher/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.system)) {
    on<ThemeChanged>(_onThemeChanged);
    on<ThemeToggle>(_onThemeToggle);
    on<UsbStatusChanged>(_onUsbStatusChanged);
    on<ThemeModeUpdated>(_onThemeModeUpdated);

    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('appTheme') ?? 'system';

    ThemeMode themeMode;
    switch (themeString) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
    }
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    String themeString;
    switch (event.themeMode) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      default:
        themeString = 'system';
    }
    await prefs.setString('appTheme', themeString);

    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onThemeToggle(
    ThemeToggle event,
    Emitter<ThemeState> emit,
  ) async {
    ThemeMode newThemeMode;
    
    newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    final prefs = await SharedPreferences.getInstance();
    String themeString;
    switch (newThemeMode) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      default:
        themeString = 'system';
    }

    await prefs.setString('appTheme', themeString);
    emit(state.copyWith(themeMode: newThemeMode));
  }

  Future<void> _onUsbStatusChanged(
    UsbStatusChanged event,
    Emitter<ThemeState> emit,
  ) async {
    // Set app bar color based on USB status
    Color? appBarColor;
    if (event.isUsbEnabled) {
      appBarColor = Colors.green.shade400; // Green when USB is enabled
    } else {
      appBarColor = Colors.red.shade400; // Red when USB is disabled
    }

    emit(
      state.copyWith(
        isUsbEnabled: event.isUsbEnabled,
        appBarColor: appBarColor,
      ),
    );
  }

  Future<void> _onThemeModeUpdated(
    ThemeModeUpdated event,
    Emitter<ThemeState> emit,
  ) async {
    emit(state.copyWith(themeMode: event.themeMode));
  }
}
