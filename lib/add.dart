import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/camera_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:csv/csv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cardData.dart';
import 'home.dart' as home;


class MyAddScreen extends StatefulWidget {
  const MyAddScreen({super.key});
  @override
  _MyAddScreenState createState() => _MyAddScreenState();
}

class _MyAddScreenState extends State<MyAddScreen> {
  bool circular = false;
  PickedFile? _imageFile;
  DateTime? _selectedDate;
  String categoryValue = "Others";
  String reminderValue = '5 days before';
  String foodName = "";
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }
  Future<List<CardData>> _loadCardData() async{
    final prefs = await SharedPreferences.getInstance();
    final encodedData = prefs.getString('card_data');
    if (encodedData != null) {
      final decodedData = jsonDecode(encodedData) as List<dynamic>;
      return decodedData.map((data) => CardData.fromJson(data)).toList();
    } else {
      return []; // Return empty list if no data is found
    }
  }

  void setName(String name){
    setState(() {
      foodName = name;
    });
  }
  
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

  void _saveCardData(List<CardData> data) async {
    data.sort((a, b) => a.expiryDate.compareTo(b.expiryDate));
    final prefs = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(data.map((card) => card.toJson()).toList());
    await prefs.setString('card_data', encodedData);
    print("data saved");

    setState(() {
      foodName = '';
      _selectedDate = null;
    });
  }

@override
  Widget build(BuildContext context) {
    const double defaultPadding = 16.0;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              imageProfile(),
              const SizedBox(height: defaultPadding),
              const Text(
                "Food Name",
                style: TextStyle(
                  fontFamily: "QuickSand",
                  fontSize: 20,
                ),
              ),
              TextField(
                onChanged: (value) => 
                  setName(value),
                decoration: const InputDecoration(
                  hintText: "Enter food name",
                ),
              ),
              const SizedBox(height: defaultPadding),
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
              const SizedBox(height: defaultPadding),
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
              const SizedBox(height: defaultPadding),
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
              const SizedBox(height: defaultPadding),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 100,
                child: FloatingActionButton(
                  onPressed: () async {
                    CardData newCard = CardData(
                      foodName: foodName,
                      expiryDate: _selectedDate.toString().substring(0, 11),
                      category: categoryValue,
                      imageUrl: "assets/images/egg.jpeg",
                      reminderRate: reminderValue,
                    );
                    List<CardData> data = await _loadCardData();
                    // List<CardData> data = [];
                    data.add(newCard);
                    _saveCardData(data);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
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

  Widget imageProfile() {
  return Center(
    child: Stack(
      children: <Widget>[
        Container(
          width: 160, // Adjust the width as needed to make it square
          height: 160, // Adjust the height as needed to make it square
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
            child: _imageFile == null
                ? Image.asset("assets/images/camera.png", fit: BoxFit.cover)
                : Image.file(File(_imageFile!.path), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 70.0,
          right: 70.0,
          width: 140,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 28.0,
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile as PickedFile;
    });
  }
}