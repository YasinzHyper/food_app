import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  //const MyWidget({Key key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).viewPadding.top,
        ),
        Container(
          height: 75,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Theme.of(context).primaryColor,
              fontSize: 26,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        buildListTile(
          'Meals',
          Icons.restaurant_menu,
          () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        buildListTile(
          'Filters',
          Icons.settings,
          () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          },
        ),
      ],
    );
  }
}
