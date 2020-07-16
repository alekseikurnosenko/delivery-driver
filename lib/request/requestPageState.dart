import 'package:built_value/built_value.dart';

part 'requestPageState.g.dart';

abstract class ButtonState {
  factory ButtonState.normal() => NormalButtonState();
  factory ButtonState.loading() => LoadingButtonState();
  factory ButtonState.disabled() => DisabledButtonState();
  
}
class NormalButtonState implements ButtonState {}
class LoadingButtonState implements ButtonState {}
class DisabledButtonState implements ButtonState {}


abstract class RequestPageState implements Built<RequestPageState, RequestPageStateBuilder> {
  ButtonState get acceptRequestButton;
  ButtonState get rejectRequestButton;

  RequestPageState._();
  factory RequestPageState([void Function(RequestPageStateBuilder) updates]) = _$RequestPageState;
}