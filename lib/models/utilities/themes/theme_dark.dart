import 'package:flutter/material.dart';
import 'package:xera_task/ui/constants/constants.dart';
import 'package:xera_task/ui/constants/style/dark_theme_constants.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: DarkThemeConstants.instance.colorPrimary,
    scaffoldBackgroundColor:
        DarkThemeConstants.instance.colorScaffoldBackground,
    colorScheme: ColorScheme.light(
        primary: DarkThemeConstants.instance.colorPrimary,
        onPrimary: DarkThemeConstants.instance.colorOnPrimary,
        secondary: DarkThemeConstants.instance.colorSecondary,
        onSecondary: DarkThemeConstants.instance.colorOnSecondary,
        secondaryContainer: DarkThemeConstants.instance.colorSecondaryContainer,
        onSecondaryContainer:
            DarkThemeConstants.instance.colorOnSecondaryContainer,
        background: DarkThemeConstants.instance.colorBackground,
        inversePrimary: DarkThemeConstants.instance.colorInversePrimary,
        error: DarkThemeConstants.instance.colorError),
    textTheme: TextTheme(
        bodyText1: DarkThemeConstants.instance.textStyleBodyText1,
        bodyText2: DarkThemeConstants.instance.textStyleBodyText2,
        subtitle1: DarkThemeConstants.instance.textStyleSubtitle1,
        headline2: DarkThemeConstants.instance.textStyleHeadline2,
        headline3: DarkThemeConstants.instance.textStyleHeadline3,
        headline4: DarkThemeConstants.instance.textStyleHeadline4,
        headline5: DarkThemeConstants.instance.textStyleHeadline5,
        button: DarkThemeConstants.instance.textStyleTextButton),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            DarkThemeConstants.instance.textStyleInputDecorationHintStyle,
        helperStyle:
            DarkThemeConstants.instance.textStyleInputDecorationHelperStyle,
        fillColor: DarkThemeConstants.instance.colorInputBorderFillColor,
        filled: UiConstants.booleanInputBorderFilled,
        isDense: UiConstants.booleanInputBorderIsDense,
        contentPadding:
            UiConstants.edgeInsetsDefaultInputDecorationContentPadding),
    appBarTheme: AppBarTheme(
        backgroundColor: DarkThemeConstants.instance.colorAppBarBackground,
        titleTextStyle: DarkThemeConstants.instance.textStyleAppBarTitle,
        iconTheme:
            IconThemeData(color: DarkThemeConstants.instance.colorAppBarIcon),
        centerTitle: UiConstants.booleanAppBarCenterTitle,
        elevation: UiConstants.doubleAppBarElevation),
    dividerTheme: DividerThemeData(
        color: DarkThemeConstants.instance.colorAppDivider,
        space: UiConstants.doubleDividerSpace,
        thickness: UiConstants.doubleDividerThickness),
    cardTheme: CardTheme(
      shape: UiConstants.shapeBorderCardShape,
      color: DarkThemeConstants.instance.colorCard,
      elevation: UiConstants.doubleCardElevation,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: DarkThemeConstants.instance.colorPrimary,
      labelStyle: DarkThemeConstants.instance.textStyleTabBarLabel,
      unselectedLabelColor:
          DarkThemeConstants.instance.colorDefaultTabBarUnselectedLabel,
      unselectedLabelStyle:
          DarkThemeConstants.instance.textStyleTabBarUnselectedLabel,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(
          DarkThemeConstants.instance.colorPrimary),
      trackColor: MaterialStateProperty.all<Color>(
          DarkThemeConstants.instance.colorSwitchTrack),
    ));
