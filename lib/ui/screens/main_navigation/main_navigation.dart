import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/utilities/system_overlay/system_overlay_service.dart';
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
          child: _pages(),
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
