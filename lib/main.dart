import 'package:flutter/material.dart';
import 'home.dart';
import 'notifications.dart';
import 'guide.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hackathon'),
        ),
      floatingActionButton: _buildFloatingActionButton(), // Add the FAB here
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Position the FAB in the center
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _items,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        
        ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          MyHomeScreen(),
          MyNotificationsScreen(),
          MyGuideScreen(),
          MyProfileScreen(),
        ],
        ),
      ),
    );
  }
}

// bottom navigation bar items
final List<BottomNavigationBarItem> _items = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.notifications),
    label: 'Notifications',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.map_outlined),
    label: 'Guide',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
];

Widget _buildFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {
      // Add your button press action here
    }, 
    backgroundColor: Color.fromARGB(150, 171, 176, 180),
    shape: const CircleBorder(),
    child: const Icon(Icons.add), 
  );
}


