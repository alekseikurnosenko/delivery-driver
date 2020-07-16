// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requestPageState.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RequestPageState extends RequestPageState {
  @override
  final ButtonState acceptRequestButton;
  @override
  final ButtonState rejectRequestButton;

  factory _$RequestPageState(
          [void Function(RequestPageStateBuilder) updates]) =>
      (new RequestPageStateBuilder()..update(updates)).build();

  _$RequestPageState._({this.acceptRequestButton, this.rejectRequestButton})
      : super._() {
    if (acceptRequestButton == null) {
      throw new BuiltValueNullFieldError(
          'RequestPageState', 'acceptRequestButton');
    }
    if (rejectRequestButton == null) {
      throw new BuiltValueNullFieldError(
          'RequestPageState', 'rejectRequestButton');
    }
  }

  @override
  RequestPageState rebuild(void Function(RequestPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestPageStateBuilder toBuilder() =>
      new RequestPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestPageState &&
        acceptRequestButton == other.acceptRequestButton &&
        rejectRequestButton == other.rejectRequestButton;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(0, acceptRequestButton.hashCode), rejectRequestButton.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RequestPageState')
          ..add('acceptRequestButton', acceptRequestButton)
          ..add('rejectRequestButton', rejectRequestButton))
        .toString();
  }
}

class RequestPageStateBuilder
    implements Builder<RequestPageState, RequestPageStateBuilder> {
  _$RequestPageState _$v;

  ButtonState _acceptRequestButton;
  ButtonState get acceptRequestButton => _$this._acceptRequestButton;
  set acceptRequestButton(ButtonState acceptRequestButton) =>
      _$this._acceptRequestButton = acceptRequestButton;

  ButtonState _rejectRequestButton;
  ButtonState get rejectRequestButton => _$this._rejectRequestButton;
  set rejectRequestButton(ButtonState rejectRequestButton) =>
      _$this._rejectRequestButton = rejectRequestButton;

  RequestPageStateBuilder();

  RequestPageStateBuilder get _$this {
    if (_$v != null) {
      _acceptRequestButton = _$v.acceptRequestButton;
      _rejectRequestButton = _$v.rejectRequestButton;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestPageState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RequestPageState;
  }

  @override
  void update(void Function(RequestPageStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RequestPageState build() {
    final _$result = _$v ??
        new _$RequestPageState._(
            acceptRequestButton: acceptRequestButton,
            rejectRequestButton: rejectRequestButton);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
