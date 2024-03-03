import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'popUpIconMenu.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String sort = "Recent";
  IconData arrowIcon = Icons.arrow_drop_down;
  List<List<dynamic>> _data = [];

  void _loadCSV() async {
    final csvString = await rootBundle.loadString("assets/savedata.csv");
    List<List<dynamic>> csvList = const CsvToListConverter().convert(csvString);
    print("data loaded");
    setState(() {
      _data = csvList;
    });
  }

  void changeSort(){
    _loadCSV();
    setState(() {
      sort = sort == "Recent" ? "Oldest" : "Recent";
      arrowIcon = sort == "Recent" ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    });
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
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    
                    // side: const BorderSide(color: Color.fromARGB(180, 255, 0, 0))
                  ),
                  color: Color.fromARGB(150, 255, 150, 150),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/milk.jpeg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Milk",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red
                                ),
                              ),
                              const Spacer(),
                              PopUpIconMenu(onSelected: (value) => {print(value)})
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                "3 days since expired",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "4.5.2024",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70,
                                height: 40,
                                child: FloatingActionButton(
                                  backgroundColor: const Color.fromARGB(255, 82, 244, 54),
                                  onPressed: () => {
                                    print("pressed")
                                  },
                                  child: Text("Reuse?"),
                                  ),

                                  )

                            ],
                          )
                        ],
                        )
                      )
                  ],
                ),
                ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/bread.jpeg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Bread",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(150, 0, 0, 0)
                                ),
                              ),
                              const Spacer(),
                              PopUpIconMenu(onSelected: (value) => {print(value)})
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                "12 days before expiration",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                "03.25.2024",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                ),
                              ),
                              Spacer(),

                            ],
                          )
                        ],
                        )
                      )
                  ],
                ),
                ),
            )

              ],
            ),
        ])
      );
  }
}
