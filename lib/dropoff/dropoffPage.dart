import 'package:delivery_driver/components/actionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../appTextStyle.dart';

part 'dropoffPage.g.dart';

Future<bool> confirmDropoffDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          content: Text("Please confirm that you have delivered the order"),          
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
Widget dropoffPage(BuildContext context, OrderAssigned order) {
  var confirmDropoffButtonState = useState(ButtonState.normal());

  final onConfirmDropoff = () async {
    var confirmed = await confirmDropoffDialog(context);
    if (confirmed == null || !confirmed) return;

    confirmDropoffButtonState.value = ButtonState.loading();

    try {
      var orderPickup =
          CouriersApi().confirmDropoff(order.courierId, order.orderId);

      Navigator.of(context).pop();
    } catch (e) {
      confirmDropoffButtonState.value = ButtonState.normal();
    }
  };
  final onNavigate = () async {
    var dropoffLocation = order.deliveryAddress.location;
    var geoUrl =
        "geo:0,0:?q=${dropoffLocation.latitude},${dropoffLocation.longitude}";
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
                    Text("Deliver to:",
                        style: AppTextStyle.sectionHeader(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("[UserName]"),
                            Text(order.deliveryAddress.address),
                          ],
                        ),
                        ActionButton(
                          label: Text("Navigate"),
                          onPressed: onNavigate,
                        )
                      ],
                    ),
                    Container(height: 8),
                    Text("[Delivery details here]"),
                    Expanded(
                      child: Container(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ActionButton(
                          label: Text("Confirm dropoff"),
                          onPressed: onConfirmDropoff,
                        )
                      ],
                    ),
                    Container(height: 32)
                  ]))));
}
