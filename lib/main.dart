import 'package:flutter/material.dart';
import 'package:greeting_application/app.dart';
import 'package:greeting_application/app_state.dart';
import 'package:greeting_application/managers/bloc_provider.dart';
import 'package:greeting_application/scenes/greeting/bloc/greeting_bloc.dart';
import 'package:greeting_application/scenes/greeting/bloc/services/color_generator.dart';

void main() {
  final colorGenerator = ColorPairGenerator();
  final greetingBloc = GreetingBloc(colorGenerator);
  final blocProvider = BlocProvider(greetingBloc);

  runApp(AppContainer(
    child: GreetingApp(),
    blocProvider: blocProvider,
  ));
}
