part of 'slider_bloc_bloc.dart';

sealed class SliderBlocEvent extends Equatable {
  const SliderBlocEvent();

  @override
  List<Object> get props => [];
}

class SliderInitialEvent extends SliderBlocEvent {}

class GetSliderEvent extends SliderBlocEvent {
  final String? sliderId, buissnessId;
  const GetSliderEvent({this.sliderId, this.buissnessId});
}
