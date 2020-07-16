import 'package:built_value/built_value.dart';

part 'testState.g.dart';

abstract class TestState implements Built<TestState, TestStateBuilder> {
  int get a;

  String get b;
  TestState._();
  factory TestState([void Function(TestStateBuilder) updates]) = _$TestState;
}
