import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  //Colors
  static final _primaryColor = Colors.teal.shade900;
  static final _onPrimaryColor = Colors.teal.shade200;
  static final _iconColor = Colors.white;
  //Text Colors
  static final _primaryTextColor = Colors.teal.shade200;
  static final _secondaryTextColor = Colors.teal.shade900;

  //Text Styles
  static final TextStyle _bodyTextLight = TextStyle(
    color: _primaryTextColor,
    fontSize: 16,
  );
  static final TextStyle _bodyTextDark = TextStyle(
    color: _primaryColor,
    fontSize: 16,
  );
  static final TextStyle _buttonText = TextStyle(
    color: _secondaryTextColor,
    fontSize: 16,
  );

  //Text Theme
  static final TextTheme _textTheme = TextTheme(
    bodyText1: _bodyTextLight,
    bodyText2: _bodyTextDark,
    button: _buttonText,
  );

  //App Theme
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: _primaryColor,
    ),
    colorScheme: ColorScheme.light(
      primary: _primaryColor,  //dark teal
      onPrimary: _onPrimaryColor,  //light teal
      secondary: _iconColor,  //white
    ),
    textTheme: _textTheme,
  );
}
