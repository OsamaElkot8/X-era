import 'package:flutter/material.dart';
import 'package:xera_task/ui/constants/constants.dart';
import 'package:xera_task/ui/constants/style/light_theme_constants.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: LightThemeConstants.instance.colorPrimary,
    scaffoldBackgroundColor:
        LightThemeConstants.instance.colorScaffoldBackground,
    colorScheme: ColorScheme.light(
        primary: LightThemeConstants.instance.colorPrimary,
        onPrimary: LightThemeConstants.instance.colorOnPrimary,
        secondary: LightThemeConstants.instance.colorSecondary,
        onSecondary: LightThemeConstants.instance.colorOnSecondary,
        secondaryContainer:
            LightThemeConstants.instance.colorSecondaryContainer,
        onSecondaryContainer:
            LightThemeConstants.instance.colorOnSecondaryContainer,
        background: LightThemeConstants.instance.colorBackground,
        inversePrimary: LightThemeConstants.instance.colorInversePrimary,
        error: LightThemeConstants.instance.colorError),
    textTheme: TextTheme(
        bodyText1: LightThemeConstants.instance.textStyleBodyText1,
        bodyText2: LightThemeConstants.instance.textStyleBodyText2,
        subtitle1: LightThemeConstants.instance.textStyleSubtitle1,
        headline2: LightThemeConstants.instance.textStyleHeadline2,
        headline3: LightThemeConstants.instance.textStyleHeadline3,
        headline4: LightThemeConstants.instance.textStyleHeadline4,
        headline5: LightThemeConstants.instance.textStyleHeadline5,
        button: LightThemeConstants.instance.textStyleTextButton),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            LightThemeConstants.instance.textStyleInputDecorationHintStyle,
        helperStyle:
            LightThemeConstants.instance.textStyleInputDecorationHelperStyle,
        fillColor: LightThemeConstants.instance.colorInputBorderFillColor,
        filled: UiConstants.booleanInputBorderFilled,
        isDense: UiConstants.booleanInputBorderIsDense,
        contentPadding:
            UiConstants.edgeInsetsDefaultInputDecorationContentPadding),
    appBarTheme: AppBarTheme(
        titleTextStyle: LightThemeConstants.instance.textStyleAppBarTitle,
        iconTheme:
            IconThemeData(color: LightThemeConstants.instance.colorAppBarIcon),
        centerTitle: UiConstants.booleanAppBarCenterTitle),
    dividerTheme: DividerThemeData(
        color: LightThemeConstants.instance.colorAppDivider,
        space: UiConstants.doubleDividerSpace,
        thickness: UiConstants.doubleDividerThickness),
    cardTheme: CardTheme(
      shape: UiConstants.shapeBorderCardShape,
      color: LightThemeConstants.instance.colorCard,
      elevation: UiConstants.doubleCardElevation,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: LightThemeConstants.instance.colorPrimary,
      labelStyle: LightThemeConstants.instance.textStyleTabBarLabel,
      unselectedLabelColor:
          LightThemeConstants.instance.colorDefaultTabBarUnselectedLabel,
      unselectedLabelStyle:
          LightThemeConstants.instance.textStyleTabBarUnselectedLabel,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(
          LightThemeConstants.instance.colorPrimary),
      trackColor: MaterialStateProperty.all<Color>(
          LightThemeConstants.instance.colorSwitchTrack),
    ));
