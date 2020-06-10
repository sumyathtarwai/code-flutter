import 'package:flutter/material.dart';
import '../models/filter.dart';
import '../const.dart';
import '../widgets/drawer_widget.dart';

class FilterPage extends StatefulWidget {
  final Function filterSetting;
  final Filter current;

  const FilterPage({
    Key key,
    this.filterSetting,
    this.current,
  }) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Filter newFilter;

  @override
  void initState() {
    var filter = widget.current;

    newFilter = Filter(
      isGlutenFree: filter.isGlutenFree,
      isLactoseFree: filter.isLactoseFree,
      isVegan: filter.isVegan,
      isVegetarian: filter.isVegetarian,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Filter',
          style: appTextStyle,
        ),
        elevation: 0,
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            buildSwitchListTile(
                context,
                'Gluten Free',
                glutenText,
                newFilter.isGlutenFree,
                (val) => setState(() => newFilter.isGlutenFree = val)),
            Divider(),
            buildSwitchListTile(context, 'Vegan', veganText, newFilter.isVegan,
                (val) => setState(() => newFilter.isVegan = val)),
            Divider(),
            buildSwitchListTile(
                context,
                'Vegetarian',
                vegetarianText,
                newFilter.isVegetarian,
                (val) => setState(() => newFilter.isVegetarian = val)),
            Divider(),
            buildSwitchListTile(
                context,
                'Lactose Free',
                lactoseText,
                newFilter.isLactoseFree,
                (val) => setState(() => newFilter.isLactoseFree = val)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveAll,
        child: Icon(Icons.save_alt),
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      BuildContext context, title, sub, bool val, Function callback) {
    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.symmetric(vertical: 15),
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: Text(
        sub,
        style: Theme.of(context).textTheme.caption,
      ),
      value: val,
      onChanged: callback,
    );
  }

  void _saveAll() {
    widget.filterSetting(newFilter);
  }
}
