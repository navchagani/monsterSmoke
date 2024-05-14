import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_customer_bloc_event.dart';
part 'update_customer_bloc_state.dart';

class UpdateCustomerBlocBloc extends Bloc<UpdateCustomerBlocEvent, UpdateCustomerBlocState> {
  UpdateCustomerBlocBloc() : super(UpdateCustomerBlocInitial()) {
    on<UpdateCustomerBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
