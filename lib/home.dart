import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String sort = "ascending";

  void changeSort(){
    sort = sort == "ascending" ? "descending" : "ascending";
  }

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
                    const Text(
                      "Recent",
                      style: TextStyle(
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
                      child: const Text("Sort"),
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