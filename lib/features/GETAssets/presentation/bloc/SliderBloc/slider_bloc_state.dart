part of 'slider_bloc_bloc.dart';

sealed class SliderBlocState extends Equatable {
  const SliderBlocState();

  @override
  List<Object> get props => [];
}

final class SliderBlocInitial extends SliderBlocState {}

class SliderLoadingSlider extends SliderBlocState {}

class SliderCompletedSlider extends SliderBlocState {
  final List<SliderModel> lilstContries;

  const SliderCompletedSlider({required this.lilstContries});
}

class SliderErrorSlider extends SliderBlocState {
  final DioException error;

  const SliderErrorSlider({required this.error});
}
