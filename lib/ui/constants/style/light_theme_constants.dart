import 'package:flutter/material.dart';

import 'constants_manager.dart';

class LightThemeConstants extends UiConstantsManager {
  static final LightThemeConstants instance = LightThemeConstants._internal();

  factory LightThemeConstants() {
    return instance;
  }

  LightThemeConstants._internal();

  @override
  Color get colorPrimary => const Color(0xff004A78);

  @override
  Color get colorOnPrimary => const Color(0xff08DEEA);

  @override
  Color get colorInversePrimary => Colors.green;

  @override
  Color get colorSecondary => const Color(0xffE5E5E5);

  @override
  Color get colorOnSecondary => Colors.grey;

  @override
  Color get colorSecondaryContainer => const Color(0xffE9E9EB);

  @override
  Color get colorOnSecondaryContainer => const Color(0xff303030);

  @override
  Color get colorBackground => Colors.white;

  @override
  Color get colorScaffoldBackground => Colors.white;

  @override
  Color get colorError => Colors.red;

  @override
  Color get colorTransparent => Colors.transparent;

  @override
  Color get colorAppBarBackground => const Color(0xff3E77F7);

  @override
  Color get colorAppBarTitleText => Colors.white;

  @override
  Color get colorAppBarIcon => Colors.white;

  @override
  Color get colorInputDecorationHintStyleColor => const Color(0xff747688);

  @override
  Color get colorInputDecorationHintIconColor => const Color(0xff807A7A);

  @override
  Color get colorInputDecorationBorderSide => const Color(0xff3E77F7);

  @override
  Color get colorSubtitle1 => Colors.grey;

  @override
  Color get colorBodyText1 => const Color(0xff3E77F7);

  @override
  Color get colorBodyText2 => Colors.black;

  @override
  Color get colorHeadline2 => Colors.black;

  @override
  Color get colorDialogBackgroundColor => Colors.white;

  @override
  Color get colorHeadline3 => const Color(0xff3E77F7);

  @override
  Color get colorHeadline4 => Colors.black;

  @override
  Color get colorHeadline5 => Colors.black;

  @override
  Color get colorInputDecorationHelperStyle => Colors.grey;

  @override
  Color get colorTextButtonTextStyle => Colors.white;

  @override
  Color get colorInputBorderFillColor => Colors.white;

  @override
  Color get colorAppDivider => const Color(0xffE1E3E8);

  @override
  Color get colorDisabledColor => const Color(0xffC4C4C4);

  @override
  Color get colorActiveColor => const Color(0xffAAA7A7);

  @override
  Color get colorCard => Colors.white;

  @override
  Color get colorOutlinedButtonBackgroundColor => Colors.transparent;

  @override
  Color get colorDefaultTabBarLabel => const Color(0xff004A78);

  @override
  Color get colorDefaultTabBarUnselectedLabel => const Color(0xff747688);

  @override
  Color get colorDefaultTabBarLabelStyleColor => const Color(0xff3E77F7);

  @override
  Color get colorDefaultTabBarUnselectedLabelStyleColor =>
      const Color(0xff707070);

  @override
  Color get colorShadow => const Color(0xff979797);

  @override
  Color get colorShadowGrey => const Color(0xffEBEBE4);

  @override
  Color get colorDefaultProgressIndicatorBackground => Colors.white;

  @override
  Color get colorDefaultTextButtonColor => const Color(0xff004A78);

  @override
  Color get colorDefaultTextButtonDisabledColor => Colors.grey;

  @override
  Color get colorDefaultTextButtonDisabledTextColor => Colors.white70;

  @override
  Color get colorDefaultImageErrorIconColor => Colors.red;

  @override
  Color get colorDefaultSkeletonColor => const Color(0xffD6D6D6);

  @override
  Color get colorDefaultSkeletonBaseColor => const Color(0xffEEEEEE);

  @override
  Color get colorDefaultSkeletonHighlightColor => Colors.white;

  @override
  Color get colorQRScanBriefContainer => const Color(0xffF5F6FC);

  @override
  Color get colorQRScanBriefLabel => Colors.black;

  @override
  Color get colorQRScanBriefDescription => Colors.black;

  @override
  Color get colorDefaultTextButton => Colors.white;

  @override
  Color get colorQRScannerBorder => Colors.black;

  @override
  Color get colorUniversitySplashSponsor1 => Colors.black;

  @override
  Color get colorUniversitySplashSponsor2 => Colors.blue;

  @override
  Color get colorOnBoardingButtonIcon => Colors.white;

  @override
  Color get colorHomeAppBarButton => Colors.white;

  @override
  Color get colorHomeAppBarImageBorder => Colors.white;

  @override
  Color get colorStatisticsCardIconBackground => Colors.white;

  @override
  Color get colorHomeCardCounter => Colors.white;

  @override
  Color get colorHomeCardScore => Colors.white;

  @override
  Color get colorHomeCardTitle => Colors.white;

  @override
  Color get colorHomeCumulativeGPACard => const Color(0xff46BD84);

  @override
  Color get colorHomeTrainingWeeksCard => const Color(0xffA5A6F6);

  @override
  Color get colorColoredDividerContainerBackground => const Color(0xffF5F6FC);

  @override
  Color get colorHomeNavigationItemIconBackground => const Color(0xffECEff1);

  @override
  Color get colorHomeNavigationItemTitle => Colors.black;

  @override
  Color get colorProfilePersonalInformationName => Colors.black;

  @override
  Color get colorProfilePersonalInformationEmail => const Color(0xff747688);

  @override
  Color get colorTitledTextViewTitle => const Color(0xff747688);

  @override
  Color get colorTitledTextViewText => Colors.black;

  @override
  Color get colorDefaultCard => const Color(0xffF5F6FC);

  @override
  Color get colorBasicShortBriefCardSubtitleCard => const Color(0xffD9D9D9);

  @override
  Color get colorBasicShortBriefCardSubtitle => const Color(0xff64748B);

  @override
  Color get colorBasicShortBriefCardTitle => Colors.black;

  @override
  Color get colorBasicShortBriefCardIconCard => const Color(0xffECEff1);

  @override
  Color get colorReusableTitledCardTitle => Colors.white;

  @override
  Color get colorTakenCourseScreenDetailsContainer => const Color(0xfff5f5f5);

  @override
  Color get colorCourseScreenDetailItemTitle => const Color(0xff747688);

  @override
  Color get colorCourseScreenDetailItemValue => Colors.black;

  @override
  Color get colorNotificationCardTitleText => const Color(0xff747688);

  @override
  Color get colorNotificationCardBodyText => Colors.black;

  @override
  Color get colorBasicShortBriefCardSimpleDetailValue => Colors.black;

  @override
  Color get colorCurrentTermCourseMidtermCard => const Color(0xffA5A6F6);

  @override
  Color get colorCurrentTermCourseActivitiesCard => const Color(0xffE9AE24);

  @override
  Color get colorCurrentTermCourseFinalCard => const Color(0xff46BD84);

  @override
  Color get colorBasicShortBriefCardNoteTitle => Colors.black;

  @override
  Color get colorBasicShortBriefCardNoteDescription => const Color(0xff747688);

  @override
  Color get colorScheduleDayName => const Color(0xffBCC1CD);

  @override
  Color get colorScheduleDayNumber => Colors.black;

  @override
  Color get colorScheduleDayItemTime => Colors.black;

  @override
  Color get colorScheduleDayItemCourse => Colors.black;

  @override
  Color get colorScheduleDayItemHall => Colors.black;

  @override
  Color get colorScheduleDayTabBarLabel => Colors.white;

  @override
  Color get colorLoginScreenTitle => Colors.black;

  @override
  Color get colorLoginScreenQRLogin => Colors.black;

  @override
  Color get colorDefaultTextFieldStyle => Colors.black;

  @override
  Color get colorDefaultTextFieldBorder => const Color(0xffE4DFDF);

  @override
  Color get colorAccountUserImageBorder => Colors.white;

  @override
  Color get colorAccountUserWelcome => const Color(0xff747688);

  @override
  Color get colorAccountUsername => Colors.black;

  @override
  Color get colorAccountUserLogOutButtonBackground => const Color(0xffF5F6FC);

  @override
  Color get colorAccountUserLogOutButtonIcon => const Color(0xff747688);

  @override
  Color get colorAccountMenuItemIconBackground => const Color(0xffF5F6FC);

  @override
  Color get colorAccountMenuItemTitle => Colors.black;

  @override
  Color get colorAccountMenuItemTrailingIcon => const Color(0xff747688);

  @override
  Color get colorSwitchTrack => const Color(0xffF5F6FC);

  @override
  Color get colorProfileImageUpdaterButtonBorder => Colors.white;

  @override
  Color get colorProfileImageUpdaterButtonIcon => Colors.white;

  @override
  Color get colorDialogScreenContainerMessage => Colors.black;

  @override
  Color get colorDefaultTextFieldSubTitle => const Color(0xff747688);

  @override
  Color get colorDefaultTextFieldError => Colors.red;

  @override
  TextStyle get textStyleHeadline2 => TextStyle(
      color: colorHeadline2,
      fontSize: 16.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500);

  @override
  TextStyle get textStyleHeadline3 => TextStyle(
      color: colorHeadline3,
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

  @override
  TextStyle get textStyleHeadline4 => TextStyle(
      color: colorHeadline4,
      fontSize: 16.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

  @override
  TextStyle get textStyleHeadline5 => TextStyle(
      color: colorHeadline5,
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

  @override
  TextStyle get textStyleBodyText1 => TextStyle(
      color: colorBodyText1,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600);

  @override
  TextStyle get textStyleBodyText2 =>
      TextStyle(color: colorBodyText2, fontFamily: 'Poppins', fontSize: 12.0);

  @override
  TextStyle get textStyleSubtitle1 =>
      TextStyle(color: colorSubtitle1, fontFamily: 'Poppins', fontSize: 9.0);

  @override
  TextStyle get textStyleInputDecorationHelperStyle => TextStyle(
      color: colorInputDecorationHelperStyle,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.w600);

  @override
  TextStyle get textStyleInputDecorationHintStyle => TextStyle(
      color: colorInputDecorationHintStyleColor, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleAppBarTitle => TextStyle(
      color: colorAppBarTitleText,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.bold);

  @override
  TextStyle get textStyleTextButton => TextStyle(
      color: colorTextButtonTextStyle, fontSize: 12.0, fontFamily: 'Poppins');

  @override
  TextStyle get textStyleTabBarLabel => const TextStyle(
        fontFamily: 'PTSans',
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get textStyleTabBarUnselectedLabel => TextStyle(
        color: colorDefaultTabBarUnselectedLabel,
        fontFamily: 'PTSans',
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get textStyleQRScanBriefLabel => TextStyle(
      fontWeight: FontWeight.w800,
      color: colorQRScanBriefLabel,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleQRScanBriefDescription =>
      TextStyle(color: colorQRScanBriefDescription, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleDefaultTextButton => TextStyle(
      fontWeight: FontWeight.w800,
      color: colorDefaultTextButton,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleDefaultTextButtonDisabled => TextStyle(
      fontWeight: FontWeight.w800,
      color: colorDefaultTextButtonDisabledTextColor,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleUniversitySplashSponsor1 => TextStyle(
      fontWeight: FontWeight.bold,
      color: colorUniversitySplashSponsor1,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleUniversitySplashSponsor2 => TextStyle(
      fontWeight: FontWeight.w700,
      color: colorUniversitySplashSponsor2,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleOnBoardingTitle => TextStyle(
      fontWeight: FontWeight.bold, color: colorPrimary, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleOnBoardingDescription =>
      TextStyle(color: colorPrimary, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleStatisticsCardCounter =>
      TextStyle(color: colorHomeCardCounter, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleStatisticsCardScore => TextStyle(
      fontWeight: FontWeight.w800,
      color: colorHomeCardScore,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleStatisticsCardTitle =>
      TextStyle(color: colorHomeCardTitle, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleHomeNavigationItemTitle =>
      TextStyle(color: colorHomeNavigationItemTitle, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleProfilePersonalInformationName => TextStyle(
      fontWeight: FontWeight.w800,
      color: colorProfilePersonalInformationName,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleProfilePersonalInformationEmail => TextStyle(
      color: colorProfilePersonalInformationEmail, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleTitledDividerTitle => TextStyle(
      fontWeight: FontWeight.w800, color: colorPrimary, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleTitledTextViewTitle => TextStyle(
      fontWeight: FontWeight.w500,
      color: colorTitledTextViewTitle,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleTitledTextViewText => TextStyle(
      fontWeight: FontWeight.w600,
      color: colorTitledTextViewText,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleBasicShortBriefCardSubtitle => TextStyle(
      fontWeight: FontWeight.w600,
      color: colorBasicShortBriefCardSubtitle,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleBasicShortBriefCardTitle => TextStyle(
      fontWeight: FontWeight.w800,
      color: colorBasicShortBriefCardTitle,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleBasicShortBriefCardSimpleDetailTitle => TextStyle(
      fontWeight: FontWeight.w700, color: colorPrimary, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleReusableTitledCardTitle => TextStyle(
      fontWeight: FontWeight.w600,
      color: colorReusableTitledCardTitle,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleTakenCourseScreenDetailItemTitle =>
      TextStyle(color: colorCourseScreenDetailItemTitle, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleTakenCourseScreenDetailItemValue => TextStyle(
      fontWeight: FontWeight.w600,
      color: colorCourseScreenDetailItemValue,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleNotificationCardTitle => TextStyle(
      fontWeight: FontWeight.w600,
      color: colorNotificationCardTitleText,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleNotificationCardBody =>
      TextStyle(color: colorNotificationCardBodyText, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleBasicShortBriefCardSimpleDetailValue => TextStyle(
      color: colorBasicShortBriefCardSimpleDetailValue, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleBasicShortBriefCardNoteTitle => TextStyle(
      fontWeight: FontWeight.w800,
      color: colorBasicShortBriefCardNoteTitle,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleBasicShortBriefCardNoteDescription => TextStyle(
      color: colorBasicShortBriefCardNoteDescription, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleScheduleDayName =>
      TextStyle(color: colorScheduleDayName, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleScheduleDayNumber => TextStyle(
      fontWeight: FontWeight.w700,
      color: colorScheduleDayNumber,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleScheduleDayItemTime => TextStyle(
      fontWeight: FontWeight.w700,
      color: colorScheduleDayItemTime,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleScheduleDayItemType =>
      const TextStyle(fontWeight: FontWeight.w700, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleScheduleDayItemCourse =>
      TextStyle(color: colorScheduleDayItemCourse, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleScheduleDayItemHall =>
      TextStyle(color: colorScheduleDayItemHall, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleLoginScreenTitle => TextStyle(
      fontWeight: FontWeight.bold,
      color: colorLoginScreenTitle,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleLoginScreenQRLogin => TextStyle(
      fontWeight: FontWeight.w700,
      color: colorLoginScreenQRLogin,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleDefaultTextFieldStyle =>
      TextStyle(color: colorDefaultTextFieldStyle, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleAccountUserWelcome =>
      TextStyle(color: colorAccountUserWelcome, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleAccountUsername => TextStyle(
      fontWeight: FontWeight.bold,
      color: colorAccountUsername,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleAccountMenuItemTitle => TextStyle(
      fontWeight: FontWeight.w700,
      color: colorAccountMenuItemTitle,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleDialogScreenContainerMessage => TextStyle(
      fontWeight: FontWeight.w700,
      color: colorDialogScreenContainerMessage,
      fontFamily: 'PTSans');

  @override
  TextStyle get textStyleDefaultTextFieldSubTitle =>
      TextStyle(color: colorDefaultTextFieldSubTitle, fontFamily: 'PTSans');

  @override
  TextStyle get textStyleDefaultTextFieldError =>
      TextStyle(color: colorDefaultTextFieldError, fontFamily: 'PTSans');
}
