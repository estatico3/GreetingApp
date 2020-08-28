import 'package:flutter/material.dart';
import 'package:greeting_application/managers/app_controller.dart';
import 'package:greeting_application/managers/bloc_provider.dart';

class AppContainer extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;

  const AppContainer({Key key, this.child, this.blocProvider})
      : super(key: key);

  @override
  AppContainerState createState() => AppContainerState();
}

class AppContainerState extends State<AppContainer> {
  BlocProvider get blocProvider => widget.blocProvider;

  static AppContainerState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppController>().state;
  }

  @override
  Widget build(BuildContext context) {
    return AppController(
      child: widget.child,
      state: this,
    );
  }
}
