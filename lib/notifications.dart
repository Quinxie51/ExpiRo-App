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
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Chicken is about to expire. Eat it fast!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("1 hour ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Bread is about to expire! eat it fast',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("12 hours ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
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
                  Text("1 day ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Ketchup is about to expire. Eat it as soon as possible!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("1 day ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Eggs are about to expire! eat it fast',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("3 days ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Cookies are about to expire! Finish it quick!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 days ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Yoghurt is about to expire! eat it fast',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("3 days ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Canned Fruit is about to expire! eat it fast',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("1 week ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Fruit juice is about to expire! Take it off the shelf!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("1 week ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Rice is about to expire! Do something about it!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("1 week ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Diet Coke is about to expire! ',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("1 week ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Spinich is about to get bad! Eat it fast!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("1 week ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Bread is about to expire! eat it fast',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
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
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Ketchup is about to expire. Eat it as soon as possible!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Eggs are about to expire! eat it fast',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'MoMo are about to expire! Finish it quick!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Yoghurt is about to expire! eat it fast',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Canned Fruit is about to expire! eat it fast',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Fruit juice has expired! Take it off the shelf!',
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
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Rice is about to expire! Do something about it!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Diet Coke is about to expire! ',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(149, 249, 237, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Prevents extra vertical space
                children: [
                  Expanded(
                    // Ensures first text fills available space
                    child: Text(
                      'Spinich is about to get bad! Eat it fast!',
                      overflow: TextOverflow.visible, // Disable ellipsis
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text("2 weeks ago",
                      textAlign: TextAlign.right), // Right-aligned
                ],
              ),
            ),
          ],
        ),
        ),
            )
        ),
        );
  }
}
