import 'package:delivery_driver/appTextStyle.dart';
import 'package:delivery_driver/customer/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:openapi/model/restaurant.dart';

part 'restaurantPage.g.dart';

@swidget
Widget _deliveryDetails(BuildContext context) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: new Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("\$0.00",
                          style: AppTextStyle.sectionHeader(context)
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text("delivery fee", style: AppTextStyle.copy(context))
                    ])),
            Container(
                height: 28,
                width: 1,
                decoration: BoxDecoration(color: Colors.grey)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("30 - 40",
                          style: AppTextStyle.sectionHeader(context)
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text("minutes", style: AppTextStyle.copy(context))
                    ]))
          ]));
}

@swidget
Widget _dishItem(BuildContext context) {
  var imageUrl =
      "https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=600,format=auto,quality=50/https://cdn.doordash.com/media/photos/3fad35a0-3c37-4b26-995d-412042b7013a-retina-large.jpg";
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Flexible(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Double D", style: AppTextStyle.sectionHeader(context)),
      Container(height: 4),
      Text(
          "Queso spread on a soft tortilla wrapped around a crunchy tortilla, filled with your choice of protein, topped with shredded cheese, lettuce, pico de gallo and & sour cream.",
          maxLines: 3,
          style: AppTextStyle.copy(context)),
      Container(height: 4),
      Text("\$3.49",
          style: AppTextStyle.copy(context).copyWith(color: Colors.black))
    ])),
    Container(
        height: 80,
        width: 80,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitHeight,
            )))
  ]));
}

@swidget
Widget _dishes(BuildContext context) {
  return Container(
      child: Column(children: [_DishItem(), _DishItem(), _DishItem()]));
}

@hwidget
Widget restaurantPage(BuildContext context, Restaurant restaurant) {
  return Scaffold(
      body: SafeArea(
          child: Container(
    padding: EdgeInsets.all(16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(restaurant.name, style: AppTextStyle.header(context)),
      Text(
        "Chinese, Asian",
        style: AppTextStyle.copy(context),
      ),
      Container(height: 4),
      Row(
        children: [
          RestaurantRating(4.8),
          Container(width: 4),
          Text("(500+) • 1.2 km • \$\$", style: AppTextStyle.copy(context)),
        ],
      ),
      Container(height: 16),
      _DeliveryDetails(),
      _Dishes()
    ]),
  )));
}
