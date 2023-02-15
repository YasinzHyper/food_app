import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key key}) : super(key: key);
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedTabIndex]['title'],
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedTabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedTabIndex,
        type: BottomNavigationBarType.shifting,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
