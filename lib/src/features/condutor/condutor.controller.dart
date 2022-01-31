import 'package:flutter/material.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:i9t/src/features/condutor/condutor.states.dart';

class CondutorController extends ValueNotifier<CondutorState> {
  CondutorController(this.condutor) : super(CondutorInitial());
  CondutorModel condutor;
}
