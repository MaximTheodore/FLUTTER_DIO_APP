import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio_app/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_dio_app/features/home/presentation/blocs/cubit/swift_code_cubit.dart';
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
      home: BlocProvider(
        create: (context) => SwiftCodeCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
