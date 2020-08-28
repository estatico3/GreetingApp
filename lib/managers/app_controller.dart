import 'package:flutter/material.dart';
import 'package:greeting_application/app_state.dart';

class AppController extends InheritedWidget {
  final AppContainerState state;
  final Widget child;

  AppController({@required this.state, @required this.child})
      : super(child: child);

  @override
  bool updateShouldNotify(AppController oldWidget) {
    return this.state != oldWidget.state;
  }
}
