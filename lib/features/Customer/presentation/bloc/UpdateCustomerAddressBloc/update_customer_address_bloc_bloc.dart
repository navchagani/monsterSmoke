import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_customer_address_bloc_event.dart';
part 'update_customer_address_bloc_state.dart';

class UpdateCustomerAddressBlocBloc extends Bloc<UpdateCustomerAddressBlocEvent, UpdateCustomerAddressBlocState> {
  UpdateCustomerAddressBlocBloc() : super(UpdateCustomerAddressBlocInitial()) {
    on<UpdateCustomerAddressBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
