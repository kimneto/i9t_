import 'package:i9t/src/features/condutor/condutor.model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeConnectionStateError extends HomeState {}

class HomeFailureState extends HomeState {
  final String error;

  HomeFailureState({required this.error});
}

class HomeSuccessState extends HomeState {
  HomeSuccessState();
}
