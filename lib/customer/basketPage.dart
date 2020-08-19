import 'package:delivery_driver/appTextStyle.dart';
import 'package:delivery_driver/iocContainer.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:openapi/model/basket_item_dto.dart';
import 'package:openapi/model/remove_from_basket_input.dart';

part 'basketPage.g.dart';

@swidget
Widget _basketItem(
    BuildContext context, BasketItemDTO basketItem, Function onDeleteClick) {
  return Container(
      padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          Text("${basketItem.quantity}x"),
          Container(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(basketItem.dish.name,
                      style: AppTextStyle.sectionHeader(context)),
                ],
              ),
              Text(basketItem.dish.name, style: AppTextStyle.copy(context))
            ],
          )),
          Text(
              "${basketItem.dish.price.currencyCode} ${basketItem.dish.price.amount * basketItem.quantity}",
              style: AppTextStyle.sectionHeader(context)),
          Container(
            width: 0,
          ),
          IconButton(
              splashRadius: 24,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.delete_outline, color: Colors.black38),
              onPressed: onDeleteClick),
        ],
      ));
}

@hwidget
Widget basketPage(BuildContext context) {
  var basketService = IocContainer().basketService;
  var basket = useStream(useMemoized(() => basketService.basket));

  var onDishDeleteClick = (BasketItemDTO basketItem) {
    var input = RemoveFromBasketInput((b) => b
      ..dishId = basketItem.dish.id
      ..quantity = basketItem.quantity
      ..restaurantId = 'TODO');

    // TODO: loading state?
    basketService.removeFromBasket(input);
  };
  var onCloseClick = () {
    Navigator.of(context).pop();
  };

  var list = ListView.separated(
      separatorBuilder: (context, index) => Divider(
            height: 1,
            indent: 48,
          ),
      itemCount: basket.data.items.length,
      itemBuilder: (context, index) => _BasketItem(basket.data.items[index],
          () => onDishDeleteClick(basket.data.items[index])));

  return SafeArea(
      child: Scaffold(
          body: Column(children: [
    Container(
        margin: EdgeInsets.only(top: 0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.close),
                      onPressed: onCloseClick))),
          Expanded(
            flex: 1,
            child: Container(
                child: Center(
                    child: Text("McSomething's",
                        style: AppTextStyle.sectionHeader(context)))),
          ),
          Expanded(flex: 1, child: Container()),
        ])),
    Expanded(child: list),
  ])));
}
