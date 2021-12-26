import 'package:app_github/src/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final appTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
  primaryColor: ColorsConstants.background,
  primarySwatch: ColorsConstants.primarySwatch,
  canvasColor: ColorsConstants.canvasColor,
  accentColor: ColorsConstants.backgroundPrincipal,
  fontFamily: 'SharonSans',
  // fontFamily: 'Segoe-UI',
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: ColorsConstants.textApagado,
    ),
  ),
  cupertinoOverrideTheme: MaterialBasedCupertinoThemeData(
    materialTheme: ThemeData(
      primaryColor: ColorsConstants.background,
      primarySwatch: ColorsConstants.primarySwatch,
    ),
  ),
);
