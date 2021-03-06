import 'package:flutter/material.dart';

import '/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorit_screen.dart';
import '/models/meal.dart';

class TabBarScreen extends StatefulWidget {
  List<Meal> favoritMeals;

  TabBarScreen(this.favoritMeals);
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
     _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Meals',
      },
      {
        'page': FavoritesScreen(widget.favoritMeals),
        'title': 'My Favorit',
      }
    ];
    super.initState();
  }

  int _selectedpageIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedpageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _selectedpageIndex,
        onTap: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorit'),
          ),
        ],
      ),
    );
  }
}
