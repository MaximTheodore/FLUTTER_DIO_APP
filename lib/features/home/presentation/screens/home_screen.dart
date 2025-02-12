import 'package:flutter/material.dart';
import 'package:flutter_dio_app/features/home/data/models/swiftcode_model.dart';
import 'package:flutter_dio_app/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_dio_app/interceptor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<SwiftCodeModel>> _fetchFuture;

  @override
  void initState() {
    super.initState();
    _fetchFuture = service<HomeRepository>().getSwiftCodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swift код')),
      body: FutureBuilder<List<SwiftCodeModel>>(
        future: _fetchFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('Нет данных'));
          }

          final codes = snapshot.data!;
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _fetchFuture = service<HomeRepository>().getSwiftCodes();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
