import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import 'reusable_card.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  accentColor: Color(0XFF5B6F7D),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.black,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: Color(0XFF5B6F7D), 
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
    ),
  ),
);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _switchValue = false;
  bool _notificationValue = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _switchValue ? darkTheme : lightTheme,
      title: 'Profile',
      home: SafeArea(
        child: Scaffold(
          // backgroundColor: Color(0XFF178FFF),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'Settings',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('images/sweta.jpg'),
                    ),
                  ),
                  title: Text(
                    'Sweta Sitaula',
                    style: KText,
                  ),
                  subtitle: Text(
                    'Edit personal details',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.mood,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 35.0,
                          ),
                          Text(
                            'Dark Mode',
                            style: KText,
                          ),
                        ],
                      ),
                      Switch(
                        value: _switchValue,
                        activeTrackColor: Colors.blueAccent,
                        onChanged: (newValue) {
                          setState(() {
                            _switchValue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                HeadlineText(heading: 'Profile'),
                ReusableCard(
                    leading: Icons.note,
                    color: Colors.orangeAccent,
                    title: 'Edit Profile',
                    trailing: Icons.arrow_forward_ios),
                ReusableCard(
                    leading: FontAwesomeIcons.wrench,
                    color: Colors.lightBlueAccent,
                    title: 'Change Password',
                    trailing: Icons.arrow_forward_ios),
                HeadlineText(heading: 'Notifications'),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.greenAccent,
                            child: Icon(
                              Icons.add_alert,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 35.0,
                          ),
                          Text(
                            'Notifications',
                            style: KText,
                          ),
                        ],
                      ),
                      Switch(
                        value: _notificationValue,
                        activeTrackColor: Colors.blueAccent,
                        onChanged: (value) {
                          setState(() {
                            _notificationValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                HeadlineText(heading: 'Regional'),
                ReusableCard(
                    leading: FontAwesomeIcons.file,
                    color: Colors.blueAccent,
                    title: 'Language',
                    trailing: Icons.arrow_forward_ios),
                ReusableCard(
                    leading: FontAwesomeIcons.signOutAlt,
                    color: Colors.red,
                    title: 'Logout',
                    trailing: Icons.arrow_forward_ios),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: HeadlineText(heading: 'App ver 2.0.1'),
                ),
              ],
            ),
          ),

          bottomNavigationBar: FFNavigationBar(
            theme: FFNavigationBarTheme(
              showSelectedItemShadow: false,
              barHeight: 70,
            ),
            selectedIndex: selectedIndex,
            onSelectTab: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              FFNavigationBarItem(
                iconData: FontAwesomeIcons.userAlt,
                label: 'Profile',
                selectedBackgroundColor: Colors.blueAccent,
              ),
              FFNavigationBarItem(
                iconData: FontAwesomeIcons.flagCheckered,
                label: 'Flag',
                selectedBackgroundColor: Colors.blueAccent,
              ),
              FFNavigationBarItem(
                iconData: FontAwesomeIcons.home,
                label: 'Home',
                selectedBackgroundColor: Colors.blueAccent,
              ),
              FFNavigationBarItem(
                iconData: FontAwesomeIcons.search,
                label: 'Search',
                selectedBackgroundColor: Colors.blueAccent,
              ),
              FFNavigationBarItem(
                iconData: FontAwesomeIcons.bars,
                label: 'Menu',
                selectedBackgroundColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadlineText extends StatelessWidget {
  final String heading;
  HeadlineText({@required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Text(
        heading,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
