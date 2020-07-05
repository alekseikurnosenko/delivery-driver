import 'package:delivery_driver/iocContainer.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

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
        child: StreamBuilder<Courier>(stream: IocContainer().courierRepository.observe(), builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading");
          }
          var courier = snapshot.data;
          return Text(courier.fullName);
        })
      ),
    );
  }

}
