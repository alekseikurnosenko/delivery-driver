import 'package:delivery_driver/appTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'homePage.g.dart';

@swidget
Widget addressPicker(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("DELIVERING TO",
            style: AppTextStyle.header(context).copyWith(
                fontSize: 9, fontWeight: FontWeight.bold, color: Colors.red)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("2312 Musselwhite Ave",
                style: AppTextStyle.sectionHeader(context)),
            Icon(Icons.keyboard_arrow_down, color: Colors.red, size: 16)
          ],
        )
      ]));
}

@swidget
Widget _rating(BuildContext context, double rating) {
  return Row(
    children: [
      Text(rating.toStringAsFixed(1),
          style: AppTextStyle.sectionHeader(context)
              .copyWith(color: Colors.green, fontSize: 12.0)),
      Icon(Icons.star, color: Colors.green, size: 12)
    ],
  );
}

@swidget
Widget restaurantItem(BuildContext context) {
  var imageUrl =
      "https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=600,format=auto,quality=50/https://cdn.doordash.com/media/photos/ecd0a764-ee9e-46c7-a1ef-8fbfd3901085-retina-large.jpg";
  return Container(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Container(
            height: 160,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
            ))),
        Container(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("China Star", style: AppTextStyle.sectionHeader(context))
        ]),
        Container(height: 4),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("\$\$ • Chinese, Asian, Takeout",
              style: AppTextStyle.copy(context)),
          Text("29 min", style: AppTextStyle.copy(context))
        ]),
        Container(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _Rating(4.8),
                Container(width: 4),
                Text("500+ ratings", style: AppTextStyle.copy(context))
              ],
            ),
            Text("\$0.99 delivery", style: AppTextStyle.copy(context))
          ],
        )
      ]));
}

@hwidget
Widget customerHomePage() {
  return Scaffold(
    body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: [
                AddressPicker(),
                RestaurantItem(),
              ],
            ))),
  );
}
