import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilteredScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> filters;

  FilteredScreen(this.filters,this.saveFilters);

  @override
  _FilteredScreenState createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.filters['gluten'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: (newValue) {
        updateValue(newValue);
      },
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filtered'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust you meal selection',
            ),
          ),
          Expanded(
              child: ListView(
                children: [
                  _buildSwitchTile(
                      'Gluten-free',
                      'Only include gluten-free meals',
                      _glutenFree,
                          (newValue) {
                          setState(() {
                            _glutenFree = newValue;
                          });
                      }
                  ),
                  _buildSwitchTile(
                      'Lactose-free',
                      'Only include Lactose-free meals',
                      _lactoseFree,
                          (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      }
                  ),
                  _buildSwitchTile(
                      'Vegetarian Food',
                      'Only include vegetarian meals',
                      _vegetarian,
                          (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      }
                  ),
                  _buildSwitchTile(
                      'Vegan',
                      'Only include vegan meals',
                      _vegan,
                          (newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      }
                  )
                ],
              ))
        ],
      ),
    );
  }
}
