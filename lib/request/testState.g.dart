// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testState.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestState extends TestState {
  @override
  final int a;
  @override
  final String b;

  factory _$TestState([void Function(TestStateBuilder) updates]) =>
      (new TestStateBuilder()..update(updates)).build();

  _$TestState._({this.a, this.b}) : super._() {
    if (a == null) {
      throw new BuiltValueNullFieldError('TestState', 'a');
    }
    if (b == null) {
      throw new BuiltValueNullFieldError('TestState', 'b');
    }
  }

  @override
  TestState rebuild(void Function(TestStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestStateBuilder toBuilder() => new TestStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestState && a == other.a && b == other.b;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, a.hashCode), b.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TestState')..add('a', a)..add('b', b))
        .toString();
  }
}

class TestStateBuilder implements Builder<TestState, TestStateBuilder> {
  _$TestState _$v;

  int _a;
  int get a => _$this._a;
  set a(int a) => _$this._a = a;

  String _b;
  String get b => _$this._b;
  set b(String b) => _$this._b = b;

  TestStateBuilder();

  TestStateBuilder get _$this {
    if (_$v != null) {
      _a = _$v.a;
      _b = _$v.b;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TestState;
  }

  @override
  void update(void Function(TestStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TestState build() {
    final _$result = _$v ?? new _$TestState._(a: a, b: b);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
