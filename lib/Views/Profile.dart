import 'package:bbz/Styles/ColorStyle.dart';
import 'package:bbz/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import '../Components/ElevatedButtonCustom.dart';
import 'package:get/get.dart';
import '../Components/BGImage.dart';
import '../Views/Auth/SignUp.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/TextRichCustom.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBarStyle(
        title: 'Profile',
        styleTitle: TextStylesCustom.textStyles_14.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
          fontSizeDelta: 13
        ),
        elevation: 2,
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_outlined),
            label: "Exam"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile"
          )
        ]),
         body: Container(
          width: double.infinity,
          height: double.infinity,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/Images/background.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              
              
              
             
              ListTile(
                    title: Text('John doe', style: TextStyle(fontSize: 39),),
                    leading: Icon(Icons.person_rounded, size: 39,),
                    iconColor: ColorStyle.primaryColor_1570A5,
                    textColor: ColorStyle.primaryColor_1570A5,
                    onTap: () => {}
                  ),
              const SizedBox(height: 16),
              const Divider(color: Colors.grey,),

               ListTile(
                    title: Text('My profile'),
                    leading: Icon(Icons.emoji_emotions_outlined),
                    iconColor: ColorStyle.primaryColor_1570A5,
                    textColor: ColorStyle.primaryColor_1570A5,
                    onTap: () => {}
                  ),
                ListTile(
                    title: Text('Booking history'),
                    leading: Icon(Icons.history),
                    iconColor: ColorStyle.primaryColor_1570A5,
                    textColor: ColorStyle.primaryColor_1570A5,
                    onTap: () => {}
                  ),
                  ListTile(
                    title: Text('Change password'),
                    leading: Icon(Icons.lock),
                    iconColor: ColorStyle.primaryColor_1570A5,
                    textColor: ColorStyle.primaryColor_1570A5,
                    onTap: () => {}
                  ),

                  const Divider(color: Colors.grey,),

                  ListTile(
                    title: Text('Log out'),
                    leading: Icon(Icons.power_settings_new),
                    iconColor: ColorStyle.red_ED0925,
                    textColor: ColorStyle.red_ED0925,
                    onTap: () => {}
                  ),
                  
              const SizedBox(height: 10,),
              
            ],
          )),
          drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
 
    );
  }
}
