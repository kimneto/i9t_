import 'package:i9t/src/features/fct/models/fct.model.dart';

abstract class FctAberturaState {}

class FctAberturaInitialState extends FctAberturaState {}

class FctAberturaLoadingState extends FctAberturaState {}

class FctAberturaFailureState extends FctAberturaState {
  final String error;

  FctAberturaFailureState({required this.error});
}

class FctAberturaSuccessState extends FctAberturaState {
  FctAberturaSuccessState();
}
