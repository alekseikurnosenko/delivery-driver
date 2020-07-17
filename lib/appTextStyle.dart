import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle copy(BuildContext context) =>
      Theme.of(context).textTheme.caption;

  static TextStyle header(BuildContext context) =>
      Theme.of(context).textTheme.headline4.copyWith(color: Colors.black);

  static sectionHeader(BuildContext context) =>
      Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.black);

}
