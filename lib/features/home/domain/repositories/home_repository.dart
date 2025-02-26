import 'package:flutter_dio_app/features/home/data/models/swiftcode_model.dart';

abstract class HomeRepository {
  Future<List<SwiftCodeModel>> getSwiftCodes();
}