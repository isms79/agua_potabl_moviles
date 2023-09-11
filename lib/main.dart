import 'package:flutter/material.dart';
import 'package:agua_potable2/presentation/screens/login.dart';
import 'package:agua_potable2/presentation/screens/registration_screen.dart';
import 'package:agua_potable2/presentation/screens/home_screen.dart';
import 'package:agua_potable2/presentation/styles/color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

static _MyAppState? of(BuildContext context) =>
  context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
bool _isDarkTheme = false;

void changeTheme(){
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
}


@override 
Widget build(BuildContext context){
  final currentTheme = _isDarkTheme ? darkColorScheme:
  lightColorScheme;
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.from(
      useMaterial3: true,
      colorScheme: currentTheme
    ),
    home: const LoginScreen(),
  );
}
}