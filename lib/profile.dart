import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 16.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect( 
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage('assets/images/user_profile.jpg'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                
                Text(
                  "Emu",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200, 
                  child: ElevatedButton(
                    onPressed: (){}, 
                    child: const Text("Edit Profile")),
                  
                ),

                const SizedBox(height: 20),
                const Divider(), 
                ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: (){},),
                ProfileMenuWidget(title: "About", icon: LineAwesomeIcons.info, onPress: (){showAboutDialog(context);},),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon),
      ),
      title:  Text(title),
    );
  }
}


  void showAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("About"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Expiry Smart is an innovative mobile application aimed at addressing the Sustainable Development Goal of responsible consumption and production. Expiry Smart seeks to revolutionize the way we manage our groceries and minimize food waste. The app allows users to easily input their grocery items along with their expiry dates, leveraging a simple and intuitive interface. With a sophisticated notification system, Expiry Smart sends timely reminders to users, alerting them when their groceries are nearing expiration. Furthermore, the app provides valuable guidance on how to utilize expired products safely and effectively, as well as offering insights into recycling options. By empowering users to make informed decisions about their consumption habits and reduce food waste, Expiry Smart embodies a commitment to sustainable living and responsible resource management."
            ),
            const Divider(),
            Text(
              "Developers: Bibhu Lammichnne, Drishtant Bhandari, Riva Kansakar, and Quincey Doan."
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close"),
          ),
        ],
      );
    },
  );
}


