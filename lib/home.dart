import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hackathon_app/cardData.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'popUpIconMenu.dart';

Future<List<CardData>> _loadCardData() async {
  final prefs = await SharedPreferences.getInstance();
  final encodedData = prefs.getString('card_data');
  if (encodedData != null) {
    final decodedData = jsonDecode(encodedData) as List<dynamic>;
    return decodedData.map((data) => CardData.fromJson(data)).toList();
  } else {
    return []; // Return empty list if no data is found
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String sort = "Recent";
  IconData arrowIcon = Icons.arrow_drop_down;
  // List<CardData> data = _loadCardData();

  void changeSort() {
    setState(() {
      sort = sort == "Recent" ? "Oldest" : "Recent";
      arrowIcon =
          sort == "Recent" ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    });
  }
  void _saveCardData(List<CardData> data) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(data.map((card) => card.toJson()).toList());
    await prefs.setString('card_data', encodedData);
    print("data saved");

    setState(() {
      print("data updated");
    });
  }

  void cardMenuAction(String value, List<CardData> data, int index) {
    if (value == "delete") {
      print("delete pressed");
      data.removeAt(index);
      _saveCardData(data);
    }else {
      print("edit pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    var data;
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
              const SizedBox(width: 8.0),
              const Text(
                "Hi Emu,",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          const Column(
            children: [
              Text(
                "Here is the list of your groceries",
                style: TextStyle(
                  fontFamily: "QuickSand",
                  fontSize: 15,
                  ),
                ),
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
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: changeSort,
                      child: Row(
                        // Use Row for horizontal arrangement
                        children: [
                          Icon(arrowIcon), // Add your desired icon
                          const SizedBox(
                              width:
                                  8.0), // Add some horizontal spacing between icon and text
                          const Text(
                            'Sort',
                            style: TextStyle(
                              fontFamily: "QuickSand",
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              FutureBuilder(
                future: _loadCardData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    data = snapshot.data;
                    return ListView(
                        shrinkWrap: true,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: DateFormat("yyyy-MM-dd").parse(data[index].expiryDate).isBefore(DateTime.now()) ? const Color.fromARGB(150, 255, 150, 150) : null,
                                // color: data[index].expiryDate.isBefore(DateTime.now()) ? const Color.fromARGB(150, 255, 150, 150) : null,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15, right: 3, top: 0, bottom: 4),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          data[index].imageUrl,
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 16.0),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  data[index].foodName,
                                                  style: TextStyle(
                                                    fontFamily: "QuickSand",
                                                    fontSize: 16,
                                                    color: DateFormat("yyyy-MM-dd").parse(data[index].expiryDate).isBefore(DateTime.now()) ? const Color.fromARGB(255, 125, 7, 7) : const Color.fromARGB(255, 177, 178, 178),
                                                    // color: data[index].expiryDate.isBefore(DateTime.now()) ? const Color.fromARGB(255, 125, 7, 7) : const Color.fromARGB(255, 177, 178, 178),
                                                  ),
                                                ),
                                                const Spacer(),
                                                PopUpIconMenu(onSelected: (value) => {cardMenuAction(value, data, index)}),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  DateFormat("yyyy-MM-dd").parse(data[index].expiryDate).difference(DateTime.now()) > Duration.zero ? "${DateFormat("yyyy-MM-dd").parse(data[index].expiryDate).difference(DateTime.now()).inDays + 1} days left" : "Expired", 
                                                  // data[index].expiryDate.difference(DateTime.now()) > Duration.zero ? "${data[index].expiryDate.difference(DateTime.now()).inDays + 1} days left" : "Expired", 
                                                  style: TextStyle(
                                                    fontFamily: "QuickSand",
                                                    fontSize: 16,
                                                    color: DateFormat("yyyy-MM-dd").parse(data[index].expiryDate).isBefore(DateTime.now()) ? const Color.fromARGB(255, 209, 2, 2) : Colors.black,
                                                    // color: data[index].expiryDate.isBefore(DateTime.now()) ? Colors.red : Colors.black,
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  data[index].expiryDate,
                                                  style: TextStyle(
                                                    fontFamily: "QuickSand",
                                                    fontSize: 12,
                                                    color: DateFormat("yyyy-MM-dd").parse(data[index].expiryDate).isBefore(DateTime.now()) ? const Color.fromARGB(255, 156, 30, 30) : const Color.fromARGB(255, 30, 156, 64),
                                                    // color: data[index].expiryDate.isBefore(DateTime.now()) ? const Color.fromARGB(255, 156, 30, 30) : const Color.fromARGB(255, 30, 156, 64),
                                                  ),
                                                ),
                                                const Spacer(),
                                                SizedBox(
                                                  width: 70,
                                                  height: 40,
                                                  child: DateFormat("yyyy-MM-dd").parse(data[index].expiryDate).isBefore(DateTime.now()) ? FloatingActionButton(backgroundColor: const Color.fromARGB(255, 82, 244, 54), onPressed: () => {print("pressed")}, child: const Text("Reuse?"),) : null, 
                                                  // child: data[index].expiryDate.isBefore(DateTime.now()) ? FloatingActionButton(backgroundColor: const Color.fromARGB(255, 82, 244, 54), onPressed: () => {print("pressed")}, child: const Text("Reuse?"),) : null, 
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      );
                    
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              
            ],
          ),
        ])));
  }
}

