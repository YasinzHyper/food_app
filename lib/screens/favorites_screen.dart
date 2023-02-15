import 'package:flutter/material.dart';

import 'package:food_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({Key key}) : super(key: key);
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Text('You have no favorites yet!');
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            id: favoriteMeals[index].id,
            //removeItem: _removeMeal,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }

  }
}
