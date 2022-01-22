import 'package:i9t/src/model/condutor.model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure({required this.error});
}

class HomeSuccess extends HomeState {
  final CondutorModel condutor;

  HomeSuccess({required this.condutor});
}
