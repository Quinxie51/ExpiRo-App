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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect( 
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      image: AssetImage('assets/images/user_profile.jpg'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Emu",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
