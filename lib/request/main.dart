import 'package:built_value/built_value.dart';
import 'package:delivery_driver/appTextStyle.dart';
import 'package:delivery_driver/request/map.dart';
import 'package:delivery_driver/request/requestPageState.dart';
import 'package:delivery_driver/request/testState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart'
    hide widget;
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

part 'main.g.dart';

@swidget
Widget _requestInfo(BuildContext context, DeliveryRequested request) =>
    Container(
      child: Column(
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              "Pickup at",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Restaurant Name"),
            Text(request.pickup.address, style: AppTextStyle.copy(context))
          ]),
          Container(
            height: 8,
          ),
          Column(
            children: <Widget>[
              Text("Deliver to", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("UserName"),
              Text(request.dropoff.address, style: AppTextStyle.copy(context))
            ],
          )
        ],
      ),
    );

abstract class Result<T> {
  factory Result.loading() => Loading<T>();
  factory Result.error() => Error<T>();
  factory Result.data(T data) => Data<T>(data);
}

class Loading<T> implements Result<T> {}

class Error<T> implements Result<T> {}

class Data<T> implements Result<T> {
  final T data;
  Data(this.data);
}

Stream<Result<int>> acceptDeliveryRequest(String orderId) async* {
  yield Result.loading();
  try {
    // var order = await CouriersApi().acceptDeliveryRequest("courierId", orderId);
    await Future.delayed(Duration(milliseconds: 300), () {});
    yield Result.data(1);
  } catch (e) {
    yield Result.error();
  }
}

class UseResult<T> {
  Function execute;
  Result<T> result;
}

UseResult<T> useFetch<T>(Stream<Result<T>> Function() provider,
    [List<Object> keys = const <dynamic>[]]) {
  var subject = useMemoized(() => PublishSubject<int>());
  var memo = useMemoized(() => subject.switchMap((value) => provider()), keys);
  var data = useStream(memo).data;

  var result = UseResult<T>();
  result.execute = () => subject.sink.add(0);
  result.result = data;

  return result;
}

UseResult<void> useRejectDeliveryRequest(String orderId) {
  Stream<Result<int>> rejectDeliveryRequest(String orderId) async* {
    yield Result.loading();
    try {
      // var order = await CouriersApi().acceptDeliveryRequest("courierId", orderId);
      print("rejecting");
      await Future.delayed(Duration(milliseconds: 300), () {});
      yield Result.data(1);
    } catch (e) {
      yield Result.error();
    }
  }

  return useFetch(() => rejectDeliveryRequest(orderId), [orderId]);
}

class RequestPageBloc {}

@hwidget
Widget _bottomSheet(BuildContext context, DeliveryRequested request) {
  var acceptButtonState = useState(ButtonState.normal());
  var rejectButtonState = useState(ButtonState.normal());

  var orderId = "1";
  var onAcceptRequest = () async {
    acceptButtonState.value = ButtonState.loading();
    rejectButtonState.value = ButtonState.disabled();

    try {
      await Future.delayed(Duration(milliseconds: 300), () {});

      Navigator.of(context).pop();
    } catch (e) {
      acceptButtonState.value = ButtonState.normal();
      rejectButtonState.value = ButtonState.normal();
      // Show error
    }
  };

   var onRejectRequest = () async {
    acceptButtonState.value = ButtonState.disabled();
    rejectButtonState.value = ButtonState.loading();

    try {
      await Future.delayed(Duration(milliseconds: 300), () {});

      Navigator.of(context).pop();
    } catch (e) {
      acceptButtonState.value = ButtonState.normal();
      rejectButtonState.value = ButtonState.normal();
      // Show error
    }
  };

  return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _RequestInfo(request),
            Container(height: 8),
            FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: () {
                  onAcceptRequest();
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(acceptButtonState.value is NormalButtonState
                    ? "Accept request"
                    : acceptButtonState.value is LoadingButtonState
                        ? "Loading"
                        : "Disabled")),
            FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: onRejectRequest,
                textColor: Colors.black,
                 child: Text(rejectButtonState.value is NormalButtonState
                    ? "Accept request"
                    : rejectButtonState.value is LoadingButtonState
                        ? "Loading"
                        : "Disabled")),
          ]));
}

class RequestPage extends StatefulWidget {
  final DeliveryRequested request;

  RequestPage({Key key, @required this.request}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RequestPageState();
  }
}

class _RequestPageState extends State<RequestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Map(
          pickup: widget.request.pickup.location,
          dropoff: widget.request.dropoff.location,
          padding: EdgeInsets.only(
              bottom: 230)), // Need to somehow get widget size here
      Column(
        children: <Widget>[
          Expanded(child: Container()),
          _BottomSheet(widget.request)
        ],
      )
    ]));
  }
}
