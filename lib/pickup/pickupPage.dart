import 'package:delivery_driver/components/actionButton.dart';
import 'package:delivery_driver/dropoff/dropoffPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../appTextStyle.dart';

part 'pickupPage.g.dart';

Future<bool> confirmPickupDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          content: Text("Please confirm that you have picked up the order"),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text("Confirm")),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancel"),
            )
          ],
        ));

@hwidget
Widget pickupPage(BuildContext context, OrderAssigned order) {
  var confirmPickupButtonState = useState(ButtonState.normal());

  final onConfirmPickup = () async {
    var confirmed = await confirmPickupDialog(context);
    if (confirmed == null || !confirmed) return;

    confirmPickupButtonState.value = ButtonState.loading();

    try {
      var orderPickup =
          await CouriersApi().confirmOrderPickup(order.courierId, order.orderId);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => DropoffPage(order)));
    } catch (e) {
      confirmPickupButtonState.value = ButtonState.normal();
    }
  };
  final onNavigate = () async {
    var pickupLocation = order.restaurantAddress.location;
    var geoUrl =
        "geo:0,0:?q=${pickupLocation.latitude},${pickupLocation.longitude}";
    if (await canLaunch(geoUrl)) {
      await launch(geoUrl);
    }
  };
  return Scaffold(
      body: SafeArea(
          child: Container(
              constraints: BoxConstraints.expand(),
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Order: ${order.orderId}",
                        style: AppTextStyle.header(context)),
                    Container(height: 8),
                    Text("[Order details here]"),
                    Container(
                      height: 32,
                    ),
                    Text("Pickup from:",
                        style: AppTextStyle.sectionHeader(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("\"${order.restaurantName}\""),
                            Text(order.restaurantAddress.address),
                          ],
                        ),
                        ActionButton(
                          label: Text("Navigate"),
                          onPressed: onNavigate,
                        )
                      ],
                    ),
                    Container(height: 8),
                    Text("[Pickup details here]"),
                    Expanded(
                      child: Container(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ActionButton(
                          label: Text("Confirm pickup"),
                          onPressed: onConfirmPickup,
                        )
                      ],
                    ),
                    Container(height: 32)
                  ]))));
}
