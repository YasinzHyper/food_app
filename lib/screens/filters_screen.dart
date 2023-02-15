
import 'package:flutter/material.dart';

//import 'package:food_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  //const MyWidget({Key key}) : super(key: key);
  static const routeName = '/filters_screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      {String title,
      String description,
      bool currentValue,
      Function updateValue}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      //drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Adjust Your Meal Selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  title: 'Gluten-free',
                  description: 'Only Include Gluten Free Meals',
                  currentValue: _glutenFree,
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Lactose-free',
                  description: 'Only Include Lactose Free Meals',
                  currentValue: _lactoseFree,
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  description: 'Only Include Vegetarian Meals',
                  currentValue: _vegetarian,
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegan',
                  description: 'Only Include Vegan Meals',
                  currentValue: _vegan,
                  updateValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
