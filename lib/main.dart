import 'package:flutter/material.dart';
import 'package:haruki/home.dart';

import 'res/colors.dart';
import 'res/strings.dart';

void main() => runApp(App());

final ThemeData _theme = _buildTheme();

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: _theme,
      home: HomeAppBar(),
    );
  }

}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: colorSecondary,
    primaryColor: colorPrimary,
    buttonColor: colorSecondary,
    scaffoldBackgroundColor: backgroundWhite,
    cardColor: backgroundWhite,
    textSelectionColor: colorSecondaryDark,
    errorColor: errorRed,

    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),

    primaryIconTheme: base.iconTheme.copyWith(
        color: fontColorPrimary
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      )
    ),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith().apply(
    fontFamily: 'Rubik',
    displayColor: fontColorPrimary,
    bodyColor: fontColorSecondary,
  );
}