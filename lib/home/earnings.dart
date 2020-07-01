import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EarningsPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: new Border.all(
              color: Colors.white,
              width: 2,
            ),
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text("\$10.0",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .apply(color: Colors.white))));
  }
}