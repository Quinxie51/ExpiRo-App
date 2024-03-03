import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String sort = "Recent";
  IconData arrowIcon = Icons.arrow_drop_down;
  void changeSort(){
    setState(() {
      sort = sort == "Recent" ? "Oldest" : "Recent";
      arrowIcon = sort == "Recent" ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    });
  }

  // String getSortType(){
  //   return ;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)), 
                  color: Color.fromARGB(150, 171, 176, 180),
                  ),
                child: const Icon(Icons.person_2_sharp),
              ),
              const SizedBox(
                  width:
                      8.0),
              const Text(
                "Hi Emu,",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("Here is the list of your groceries")),
                ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 25),
                  child: Row(
                  children: [
                    Text(
                      sort,
                      style: const TextStyle(
                        fontFamily: "QuickSand",
                        fontSize: 15,
                      ),
                      ),

                      const Spacer(),

                      ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ))
                      ),
                      onPressed: changeSort, 
                      child:  Row( // Use Row for horizontal arrangement
                          children: [
                            Icon(arrowIcon), // Add your desired icon
                            const SizedBox(width: 8.0), // Add some horizontal spacing between icon and text
                            const Text('Sort'),
                          ],
                        ),
                      ),
                  ],
                ),
                )
              ],
            ),
          ],
        )
      );
  }
}