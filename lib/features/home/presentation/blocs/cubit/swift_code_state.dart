part of 'swift_code_cubit.dart';

@immutable
sealed class SwiftCodeState {
  const SwiftCodeState();
}

class SwiftCodeInitial extends SwiftCodeState {
  const SwiftCodeInitial();
}

class SwiftCodeLoading extends SwiftCodeState {
  const SwiftCodeLoading();
}

class SwiftCodeLoaded extends SwiftCodeState {
  final List<SwiftCodeModel> swiftCodes;

  const SwiftCodeLoaded(this.swiftCodes);
}

class SwiftCodeError extends SwiftCodeState {
  final String message;

  const SwiftCodeError(this.message);
}
