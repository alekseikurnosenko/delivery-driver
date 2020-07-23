import 'package:delivery_driver/iocContainer.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart' as API;
import 'package:firebase_messaging/firebase_messaging.dart';

import 'home/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String token =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlJVUkNNa0ZHTWpsR1FUZ3lPVU5CUkVFMU9EaEJNRGt3UlRaRVEwRkZPVU0xUkRVelF6aERRZyJ9.eyJpc3MiOiJodHRwczovL2Rldi1kZWxpdmVyeS5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWU0YzVkODg0Y2JhMGUwZjE2Mjc3ZWYxIiwiYXVkIjoiaHR0cHM6Ly9kZWxpdmVyeS9hcGkiLCJpYXQiOjE1OTQxMTIzMTAsImV4cCI6MTU5NjcwNDMxMCwiYXpwIjoiR1l1OHFydUpoTnpMTTFKZWlQaWNVWFpmSXljNjNlUXYiLCJndHkiOiJwYXNzd29yZCIsInBlcm1pc3Npb25zIjpbXX0.ljIjZlTBlc8ASjoo2fPzG6E_vXPjGB8MzMRjZ_sG9St0amsQNcTztPRwMEVLzzIIXkLSw91aKUa-HiVvPdyanOnGrKmC5u1wjUZJ35FPe552OOisQBi_8-KHEAgNQYUKotisO4I5IajjVvkoAASCa2cyR9p3MC4Iyg3li84sSQyyUKksVaOO7Afm130sN3-c_5iD9K18xIVTV3pJJRSplwpNpbb9U8rDyiXRQ9c_2Yrs2PNyxNTCZPbZflWodggJf3-cQGpsWK6aPfIFW9EH4cjn03kT1X58i_SbHnX7G_56vwbLDovqxgCE3RAC_FQRfMQ5jb-BnpfW2gWIygXIWg";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    API.defaultApiClient.addDefaultHeader("Authorization", "Bearer $token");

    IocContainer().courierRepository.fetch();

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    _firebaseMessaging.configure(onMessage: (message) async {
      print("OnMessage: $message");
    }, onResume: (message) async {
      print("OnResume: $message");
    }, onLaunch: (message) async {
      print("OnLaunch: $message");
    });

    _firebaseMessaging.getToken().then((value) => print("Token: $value"));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(height: 36)),
      home: HomePage(),
    );
  }
}
