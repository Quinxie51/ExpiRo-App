import 'package:flutter/material.dart';

class MyAddScreen extends StatefulWidget {
  const MyAddScreen({Key? key}) : super(key: key);

  @override
  _MyAddScreenState createState() => _MyAddScreenState();
}

class _MyAddScreenState extends State<MyAddScreen> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 16.0;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0), // Set the desired margin value
          child: Column(
            children: [
              const Text(
                "Food Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter food name",
                ),
              ),
              const SizedBox(height: defaultPadding), // Add a SizedBox for spacing
              const Text(
                "Expiry Date",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    hintText: "Select expiry date",
                  ),
                  child: Text(
                    _selectedDate != null
                        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                        : "Select expiry date",
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding), // Add a SizedBox for spacing
              const Text(
                "Category",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton(
                isExpanded: true,
                items: const <String>[
                  'Fruit',
                  'Vegetable',
                  'Meat',
                  'Dairy',
                  'Bakery',
                  'Pantry',
                  'Frozen',
                  'Beverage',
                  'Others'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              const SizedBox(height: defaultPadding), // Add a SizedBox for spacing
              const Text(
                "Set Reminder",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton(
                isExpanded: true,
                items: const <String>[
                  '1 day before',
                  '2 days before',
                  '5 days before',
                  'A week before',
                  'A month before'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              const SizedBox(height: defaultPadding), // Add a SizedBox for spacing
              Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Center(
                    child: Icon(Icons.camera_alt),
                  )),
              const SizedBox(height: defaultPadding), // Add a SizedBox for spacing
              Container(
                width: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    // Put your code here to be executed when the FAB is pressed.
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add), // Add leading add icon here
                      Text("Add"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
