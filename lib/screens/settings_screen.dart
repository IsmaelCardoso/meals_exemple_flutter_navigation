import 'package:flutter/material.dart';
import '../models/settings_model.dart';
import '../widgets/main_drawer_widget.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createWchitch({
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createWchitch(
                title: 'Gluten-free',
                subtitle: 'Displays only gluten-free food',
                value: settings.isGlutenFree,
                onChanged: (value) =>
                    setState(() => settings.isGlutenFree = value),
              ),
              _createWchitch(
                title: 'Lactose-free',
                subtitle: 'Displays only lactose-free food',
                value: settings.isLactoseFree,
                onChanged: (value) =>
                    setState(() => settings.isLactoseFree = value),
              ),
              _createWchitch(
                title: 'Vegan',
                subtitle: 'Displays only vegan food',
                value: settings.isVegan,
                onChanged: (value) => setState(() => settings.isVegan = value),
              ),
              _createWchitch(
                title: 'Vegetarian',
                subtitle: 'Displays only vegetarian food',
                value: settings.isVegetarian,
                onChanged: (value) =>
                    setState(() => settings.isVegetarian = value),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
