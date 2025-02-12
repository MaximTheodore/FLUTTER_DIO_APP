import 'package:flutter/material.dart';
import 'package:flutter_dio_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_dio_app/interceptor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
