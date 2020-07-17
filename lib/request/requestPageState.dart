import 'package:built_value/built_value.dart';
import 'package:delivery_driver/components/actionButton.dart';

part 'requestPageState.g.dart';


abstract class RequestPageState implements Built<RequestPageState, RequestPageStateBuilder> {
  ButtonState get acceptRequestButton;
  ButtonState get rejectRequestButton;

  RequestPageState._();
  factory RequestPageState([void Function(RequestPageStateBuilder) updates]) = _$RequestPageState;
}