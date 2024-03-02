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
        )),
        body: Flexible(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: EdgeInsets.all(10),
              // color: const Color.fromARGB(255, 158, 200, 234),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 242, 242, 242),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Fried Chicken is about to expire! eat it fast',
                      textAlign: TextAlign.left),
                  Spacer(),
                  Text(
                    "1 hour ago",
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: EdgeInsets.all(10),
              // color: const Color.fromARGB(255, 158, 200, 234),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 242, 242, 242),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Bread is about to expire! eat it fast',
                      textAlign: TextAlign.left),
                  Spacer(),
                  Text(
                    "12 hours ago",
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 242, 242, 242),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Milk has expired. Click here to learn what you can do with it',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("1 week ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
          ],
        )));
  }
}
