import 'package:delivery_driver/home/homePage.dart';
import 'package:delivery_driver/request/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String token =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlJVUkNNa0ZHTWpsR1FUZ3lPVU5CUkVFMU9EaEJNRGt3UlRaRVEwRkZPVU0xUkRVelF6aERRZyJ9.eyJpc3MiOiJodHRwczovL2Rldi1kZWxpdmVyeS5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWUwZjQxYmIwNDhmODAwZWE3MjlkYjQzIiwiYXVkIjoiaHR0cHM6Ly9kZWxpdmVyeS9hcGkiLCJpYXQiOjE1OTczNTM5MzgsImV4cCI6MTU5OTk0NTkzOCwiYXpwIjoiR1l1OHFydUpoTnpMTTFKZWlQaWNVWFpmSXljNjNlUXYiLCJndHkiOiJwYXNzd29yZCIsInBlcm1pc3Npb25zIjpbXX0.ktzslmqoRIRGfj8Se5t8cUUfZkRj6iMZ12iOgpTM4Uy4q98G0LDDG4rr43IH3JGiEyrD5gsmxjDdE7g4gS-xXvOid_5l658ngoGo062v5sZeJWblp7XI_AOCMk7i_OUUuo7eANRmtToriRZ96yLOjJChzEd2OwGgTPkQ2XNN-P9NbIOId2ERcY1NGkndNiVlVp5aQiRaeVymjDX-OoUFhJip9Q_zMeBA7akJ0r-Wolg-7g_ZmCZgvnAYpKIRgoibqY-mXAz5Pqz_NS9z3r_YV2czEL4IE8FCRY_68kLd7gWLpHp9A3dX6T4PnXjH-EFtW3xlU1g1Hd1YPwajhjiLsg";
  @override
  Widget build(BuildContext context) {
    // API.defaultApiClient.addDefaultHeader("Authorization", "Bearer $token");

    // IocContainer().courierRepository.fetch();

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
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/request": (context) => RequestPage(),
      },
    );
  }
}
