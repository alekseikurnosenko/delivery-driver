import 'package:delivery_driver/iocContainer.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:openapi/api.dart';

part 'main.g.dart';

@widget
Widget profileWidget(Courier courier) => Container(
        padding: EdgeInsets.all(16),
        height: 128,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          Container(
            width: 96,
            height: 96,
            decoration:
                BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(courier.fullName, style: TextStyle(fontSize: 24)),
              Row(
                children: <Widget>[
                  Text("Reputation: "),
                  Text(
                    "Good",
                    style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          )
        ]));

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    IocContainer().courierRepository.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Container(
          child: StreamBuilder<Courier>(
              stream: IocContainer().courierRepository.observe(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                }
                var courier = snapshot.data;
                return ProfileWidget(courier);
              })),
    );
  }
}
