import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 16.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: const Column(
            children: [
              SizedBox(
                width: 190, height: 120,
                child: Image (image: AssetImage('assets/images/user_profile.jpg')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
