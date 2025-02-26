import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_app/features/home/data/models/swiftcode_model.dart';
import 'package:flutter_dio_app/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_dio_app/interceptor.dart';
part 'swift_code_state.dart';

class SwiftCodeCubit extends Cubit<SwiftCodeState> {
  SwiftCodeCubit() : super(SwiftCodeInitial());

  final HomeRepository homeRepository = service<HomeRepository>();

  Future<void> fetchSwiftCodes() async {
    emit(SwiftCodeLoading());
    try {
      final List<SwiftCodeModel> swiftCodes = await homeRepository.getSwiftCodes();
      emit(SwiftCodeLoaded(swiftCodes) as SwiftCodeState);
    } catch (e) {
      emit(SwiftCodeError(e.toString()) as SwiftCodeState);
    }
  }
}