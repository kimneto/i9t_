import 'package:i9t/src/features/fct/models/fct.model.dart';

abstract class FctsFechadasState {}

class FctsFechadasInitial extends FctsFechadasState {}

class FctsFechadasLoading extends FctsFechadasState {}

class FctsFechadasFailure extends FctsFechadasState {
  final String error;

  FctsFechadasFailure({required this.error});
}

class FctsFechadasSuccess extends FctsFechadasState {
  final List<FctModel> fctsFechadas;

  FctsFechadasSuccess({required this.fctsFechadas});
}
