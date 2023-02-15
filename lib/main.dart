import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/category_screen.dart';
import 'screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => mealId == meal.id);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => mealId == meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YumFoods',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.orange,
        canvasColor: Color.fromRGBO(251, 250, 222, 0.992),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoryScreen(),

      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      },
    );
  }
}
