import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()); // Start with light theme

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    if (event is ToggleThemeEvent) {
      yield state.brightness == Brightness.dark
          ? ThemeData.light()
          : ThemeData.dark();
    }
  }
}
