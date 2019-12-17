import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Map<String, Object>> _tabPages = [
    {"screen": CategoriesScreen(), "title": "Categories"},
    {"screen": FavoritesScreen(), "title": "Favorites"}
  ];

  int _selectedScreenIdx = 0;

  void _selectTab(int idx) {
    setState(() {
      _selectedScreenIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabPages[_selectedScreenIdx]["title"]),
      ),
      body: SafeArea(child: _tabPages[_selectedScreenIdx]["screen"]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIdx,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
