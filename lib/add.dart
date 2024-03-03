import 'dart:io';

import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:permission_handler/permission_handler.dart';

class MyAddScreen extends StatefulWidget {
  const MyAddScreen({super.key});

  @override
  _MyAddScreenState createState() => _MyAddScreenState();
}

class _MyAddScreenState extends State<MyAddScreen> {
  DateTime? _selectedDate;
  String categoryValue = "Others";
  String reminderValue = '5 days before';
  String foodName = "";


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

  void categorySelected(newCategory){
    setState(() {
      categoryValue = newCategory != categoryValue ? newCategory: categoryValue;
    });
  }

  void reminderSelected(newReminder){
    setState(() {
      reminderValue = newReminder != reminderValue ? newReminder: reminderValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 16.0;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Set the desired margin value
          child: Column(
            children: [
              const Text(
                "Food Name",
                style: TextStyle(
                  fontFamily: "QuickSand",
                  fontSize: 20,
                ),
              ),
              TextField(
                onSubmitted: (value) {
                  foodName = value;
                },
                decoration: const InputDecoration(
                  hintText: "Enter food name",
                ),
              ),
              const SizedBox(height: defaultPadding), // Add a SizedBox for spacing
              const Text(
                "Expiry Date",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "QuickSand",
                ),
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
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
                  fontFamily: "QuickSand",
                ),
              ),
              DropdownButton(
                isExpanded: true,
                value: categoryValue,
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
                onChanged: (_) {
                  categorySelected(_);
                },
              ),
              const SizedBox(height: defaultPadding), // Add a SizedBox for spacing
              const Text(
                "Set Reminder",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "QuickSand",
                ),
              ),
              DropdownButton(
                isExpanded: true,
                value: reminderValue,
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
                onChanged: (_) {
                  reminderSelected(_);
                },
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
              SizedBox(
                width: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    // Put your code here to be executed when the FAB is pressed.
                    List<List<dynamic>> csvData = [
                      ["Food Name", "Expiry Date", "Category", "Reminder"],
                          [foodName, _selectedDate.toString(), categoryValue, reminderValue],
                        ];
                    
                    String csvString = ListToCsvConverter().convert(csvData);
                    _saveToCsv(csvString);
                  },
                  child: const Row(
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
  
void _saveToCsv(String csvString) async {
  String filePath = "savedata.csv"; // Adjust path if needed
  print(filePath);
  

  final file = await File(filePath).create();
  await file.writeAsString(csvString);

  if (Platform.isAndroid) {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        final file = await File(filePath).create(); // Create file if needed
        await file.writeAsString(csvString);
      } catch (e) {
        print("Error creating or writing to file: $e");
      }
    } else {
      print("Storage permission denied");
    }
  } else {
    try {
      final file = await File(filePath).create(); // Create file if needed
      await file.writeAsString(csvString);
    } catch (e) {
      print("Error creating or writing to file: $e");
    }
  }
}
}