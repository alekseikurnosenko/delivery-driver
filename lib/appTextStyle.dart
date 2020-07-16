import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle copy(BuildContext context) => 
    Theme.of(context).textTheme.caption;
}