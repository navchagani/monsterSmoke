import 'package:flutter_bloc/flutter_bloc.dart';

class IsMobile extends Bloc<bool, bool> {
  IsMobile() : super(false) {
    on<bool>((event, emit) => emit(event));
  }
}

class AuthAction extends Bloc<bool, bool> {
  AuthAction() : super(true) {
    on<bool>((event, emit) => emit(event));
  }
}
