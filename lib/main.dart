import 'package:flutter/material.dart';
import 'package:toonflix/screens/home.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  ApiService().getTodaysToon();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Pretendard"),
      home: const Home(),
    );
  }
}
