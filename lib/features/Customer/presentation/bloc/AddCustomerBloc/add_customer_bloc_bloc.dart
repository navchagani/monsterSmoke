import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_customer_bloc_event.dart';
part 'add_customer_bloc_state.dart';

class AddCustomerBlocBloc extends Bloc<AddCustomerBlocEvent, AddCustomerBlocState> {
  AddCustomerBlocBloc() : super(AddCustomerBlocInitial()) {
    on<AddCustomerBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
