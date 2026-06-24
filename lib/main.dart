import 'package:auris/auris.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usbswitcher/bloc/theme/theme_bloc.dart';
import 'package:usbswitcher/bloc/theme/theme_state.dart';
import 'package:usbswitcher/screens/home_screen.dart';

void main() {
  runApp(BlocProvider(create: (context) => ThemeBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'USB Switcher',
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          theme: AurisTheme.light(
            accent: Colors.green,
            bevelScale: 1.0,
            glowScale: 1.5,
          ),
          darkTheme: AurisTheme.dark(
            accent: Colors.green,
            bevelScale: 1.0,
            glowScale: 1.5,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
