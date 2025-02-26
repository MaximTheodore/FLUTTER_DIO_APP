import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio_app/features/home/presentation/blocs/cubit/swift_code_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SwiftCodeCubit>().fetchSwiftCodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swift код')),
      body: BlocBuilder<SwiftCodeCubit, SwiftCodeState>(
        builder: (context, state) {
          if (state is SwiftCodeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SwiftCodeError) {
            return Center(child: Text('Ошибка: ${state.message}'));
          } else if (state is SwiftCodeLoaded) {
            final codes = state.swiftCodes;
            return ListView.builder(
              itemCount: codes.length,
              itemBuilder: (context, index) {
                final code = codes[index];
                return ListTile(
                  title: Text(code.swift_code),
                  subtitle: Text(
                    'Банк: ${code.bank_name}\n'
                    'Город: ${code.city}\n'
                    'Страна: ${code.country} - ${code.country_code}',
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Нет данных'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SwiftCodeCubit>().fetchSwiftCodes();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

