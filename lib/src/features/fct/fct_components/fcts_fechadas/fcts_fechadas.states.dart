import 'package:i9t/src/features/fct/models/fct.model.dart';

abstract class FctsFechadasState {
  late String error;
  late List<FctModel> fctsFechadas;
}

class FctsFechadasInitial extends FctsFechadasState {}

class FctsFechadasLoading extends FctsFechadasState {}

class FctsFechadasEmpty extends FctsFechadasState {}

class FctsFechadasFailure extends FctsFechadasState {
  @override
  final String error;

  FctsFechadasFailure({required this.error});
}

class FctsFechadasSuccess extends FctsFechadasState {
  final List<FctModel> fctsFechadas;

  FctsFechadasSuccess({required this.fctsFechadas});
}
