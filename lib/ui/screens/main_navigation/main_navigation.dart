import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/paints/night_stars_paint.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/models/utilities/system_overlay/system_overlay_service.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';
import 'package:xera_task/ui/screens/discover/discover_page.dart';
import 'package:xera_task/ui/screens/search/search_page.dart';

class MainNavigation extends StatefulWidget {
  static const String id = 'mainNavigation';

  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final double _screenHorizontalPaddingSpace = 18.0,
      _screenVerticalPaddingSpace = 12.0;
  EdgeInsetsGeometry get _screenPadding => EdgeInsets.symmetric(
      horizontal: _screenHorizontalPaddingSpace,
      vertical: _screenVerticalPaddingSpace);

  Future<void> _statusBarTransparent() async =>
      await SystemOverlayService.instance.statusBarTransparent();

  @override
  void initState() {
    _statusBarTransparent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
              builder: (context, state) {
            final LocalSettings settings = state.settings;
            final UiConstantsManager currentThemeModeConstants = SettingsService
                .instance
                .currentThemeModeConstants(localSettings: settings);

            return CustomPaint(
              painter: NightStarsPaint(
                  upperColor: currentThemeModeConstants.colorPrimary,
                  lowerColor:
                      currentThemeModeConstants.colorScaffoldBackground),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: _screenPadding,
                child: _pages(),
              ),
            );
          }),
        ),
        bottomNavigationBar: _buildBottomBar(context));
  }

  Widget _pages() {
    List<Widget> pages = [
      DiscoverPage(),
      const SearchPage(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  Widget _buildBottomBar(BuildContext context) => BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.discover,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.search_circle),
            activeIcon: const Icon(CupertinoIcons.search_circle_fill),
            label: AppLocalizations.of(context)!.search,
          )
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      );
}
