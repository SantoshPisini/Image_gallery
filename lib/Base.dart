import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/HomeScreen.dart';

class Base extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Base> {
  int _tabIndex;

  @override
  void initState() {
    _tabIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Nature'),
        backgroundColor: Colors.green,
      ),
      body: HomeScreen(
        isFavourite: _tabIndex == 1,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Favorite',
              tooltip: 'Favorite'),
        ],
        currentIndex: _tabIndex,
        selectedItemColor: Colors.green,
        onTap: _tabTapped,
        showUnselectedLabels: false,
      ),
    );
  }

  void _tabTapped(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}
