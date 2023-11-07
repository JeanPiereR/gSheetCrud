import 'package:api_proyect/gsheets/equipos/gsheetsEquipos.dart';
import 'package:api_proyect/screens/homeScreen.dart';
import 'package:api_proyect/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const HomeScreen()
      );
  }
}
