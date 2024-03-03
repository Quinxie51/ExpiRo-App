// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class MyAddScreen extends StatelessWidget {
//   const MyAddScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const double defaultPadding = 16.0;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Profile",
//           style: Theme.of(context).textTheme.headline6,
//         ),
//       ),
//       body: const Text("Add Screen"),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MyAddScreen extends StatelessWidget {
  const MyAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 16.0;
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
          Text(
            "Food Name",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter food name",
            ),
          ),
        ],
      ),
    );
  }
}
