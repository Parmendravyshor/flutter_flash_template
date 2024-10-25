import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme_event.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Theme')),
      body: Center(
        child: BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, theme) {
            return SwitchListTile(
              title: const Text('Dark Mode'),
              value: theme.brightness == Brightness.dark,
              onChanged: (_) {
                BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent());
              },
            );
          },
        ),
      ),
    );
  }
}
