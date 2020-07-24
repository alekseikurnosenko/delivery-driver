import 'package:delivery_driver/profile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:openapi/model/courier.dart';

part 'profileWidget.g.dart';

@widget
Widget profileWidget(BuildContext context, Courier courier) {
  // HACK
  var initials = courier != null
      ? courier.fullName
          .split(" ")
          .map((e) => e.substring(0, 1).toUpperCase())
          .join()
      : "";

  return GestureDetector(
      onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProfilePage()))
          },
      child: Stack(children: [
        Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
                child:
                    Text(initials, style: Theme.of(context).textTheme.button))),
        Container(
          width: 44,
          height: 44,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.black)),
        )
      ]));
}
