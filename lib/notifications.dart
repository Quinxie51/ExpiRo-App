import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyNotificationsScreen extends StatelessWidget {
  const MyNotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Notifications',
            style: TextStyle(
              fontFamily: "QuickSand",
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
            )
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        padding: const EdgeInsets.all(30.0),
        color: const Color.fromARGB(255, 158, 200, 234),
        height: 200.0,
        width: MediaQuery.of(context).size.width*0.80,
        child: const Text('Notifications'),
      )
    );
  }
}