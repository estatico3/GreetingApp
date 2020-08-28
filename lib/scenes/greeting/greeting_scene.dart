import 'package:flutter/material.dart';
import 'package:greeting_application/app_state.dart';
import 'package:greeting_application/app_theme.dart';
import 'package:greeting_application/scenes/greeting/bloc/greeting_bloc.dart';

class GreetingScene extends StatelessWidget {
  final _greetingText = "Hey there";

  @override
  Widget build(BuildContext context) {
    var _bloc = AppContainerState.of(context).blocProvider.greetingBloc;
    return Scaffold(
        body: GestureDetector(
      onTap: () => _bloc.updateColor(),
      child: buildAnimatedBody(_bloc),
    ));
  }

  StreamBuilder<Color> buildAnimatedBody(GreetingBloc _bloc) {
    return StreamBuilder<Color>(
        initialData: AppTheme.defaultBackgroundColor,
        stream: _bloc.colorStream,
        builder: (context, snapshot) {
          return TweenAnimationBuilder(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInCubic,
            tween: ColorTween(
                begin: AppTheme.defaultBackgroundColor, end: snapshot.data),
            builder: (context, color, child) {
              return Container(
                decoration: BoxDecoration(color: color),
                child: Center(
                  child: buildAnimatedText(_bloc),
                ),
              );
            },
          );
        });
  }

  StreamBuilder<Color> buildAnimatedText(GreetingBloc _bloc) {
    return StreamBuilder<Color>(
        initialData: AppTheme.defaultTextColor,
        stream: _bloc.textColorStream,
        builder: (context, snapshot) {
          return TweenAnimationBuilder(
              tween: ColorTween(
                begin: AppTheme.defaultTextColor,
                end: snapshot.data,
              ),
              duration: Duration(seconds: 1),
              curve: Curves.bounceIn,
              builder: (context, color, child) {
                return Text(
                  _greetingText,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: snapshot.data),
                );
              });
        });
  }
}
