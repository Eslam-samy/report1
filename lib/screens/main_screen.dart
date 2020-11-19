import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:report1/helper/my_storage.dart';
import 'package:report1/screens/add_new_data_screen.dart';
import 'package:report1/screens/view_data_screen.dart';
import 'package:report1/widgets/input_container.dart';

class mainScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    addNewDataScreen(),
    viewDataScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _loaded = true;
    });
  }

  bool _loaded = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.purple, fontSize: 12),
        unselectedIconTheme: IconThemeData(size: 25, color: Colors.black54),
        selectedIconTheme: IconThemeData(size: 25, color: Color.fromRGBO(241, 96, 36, 1)),
        unselectedLabelStyle: TextStyle(color: Colors.black54, fontSize: 12),
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(
              Icons.print,
              size: 20,
            ),
            title: Text(
              'Hello',style: TextStyle(color: Color.fromRGBO(241, 96, 36, 1)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
            Icons.storage,
              size: 20,
            ),
            title: Text(
            'hello',style: TextStyle(color: Color.fromRGBO(241, 96, 36, 1))
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
