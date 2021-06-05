import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories.screen.dart';
import '../screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>> _screens = [
    {'title': 'List of Categories', 'screen': CategoriesScreen()},
    {'title': 'My Favorites', 'screen': FavoriteScreen()},
  ];

  _selectScreen(int index) => setState(() => _selectedScreenIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        //onTap: (index) => _selectScreen(index),
        //Tambem pode ser feito assim já que o "onTap é uma função que recebe um int e o passa"
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
