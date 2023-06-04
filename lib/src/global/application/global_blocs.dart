import 'package:clippy/src/global/application/global_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'global_events.dart';

class GlobalBlocs extends Bloc<GlobalEvents, GlobalStates> {
  GlobalBlocs() : super(InitStates()) {
    on<ToggleTheme>((event, emit) => emit(GlobalStates(
        themeMode: state.themeMode.name == 'dark'
            ? ThemeMode.light
            : ThemeMode.dark)));
  }
}
