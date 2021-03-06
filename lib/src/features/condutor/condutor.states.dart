import 'package:i9t/src/features/condutor/condutor.model.dart';

abstract class CondutorState {}

class CondutorInitial extends CondutorState {}

class CondutorLoading extends CondutorState {}

class CondutorFailure extends CondutorState {
  final String error;

  CondutorFailure({required this.error});
}

class CondutorSuccess extends CondutorState {
  final CondutorModel condutor;

  CondutorSuccess({required this.condutor});
}
