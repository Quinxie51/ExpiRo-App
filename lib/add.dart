import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
              Container(
  width: 400,
  height: 200,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
  ),
  child: Center(
    child: SizedBox( // or Container
      width: 200, // Adjust width as needed
      height: 50, // Adjust height as needed
      child: ElevatedButton(
        onPressed: () async {
          await availableCameras().then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(cameras: value),
              ),
            ),
          );
        },
        child: Text('Launch Camera'),
      ),
    ),
  ),
),

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

              const SizedBox(height: defaultPadding), // Add a SizedBox for spacing
              SizedBox(
                width: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    // Put your code here to be executed when the FAB is pressed.
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
}
/* Widget imageProfile() {
  return Center(
    child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/images/camera.png") as ImageProvider<Object>?
              : FileImage(File(_imageFile!.path)) as ImageProvider<Object>?,
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
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
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
   
}
 */