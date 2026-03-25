import 'package:flutter/material.dart';
import 'package:flutter_application_5/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Consumer<ThemeProvider>(
        builder: (_, provider, __){
          return SwitchListTile.adaptive(
            title: Text('Dark Mode'),
            subtitle: Text('Change theme mode here'),
            onChanged: (value){
              provider.updateTheme(value: value);       
            },
            value: provider.getThemeValue(),
            );

        })
    );
  }
}