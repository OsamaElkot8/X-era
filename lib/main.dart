import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/utilities/localizations/locales_constants.dart';
import 'package:xera_task/models/utilities/themes/theme_dark.dart';
import 'package:xera_task/models/utilities/themes/theme_light.dart';
import 'package:xera_task/ui/screens/home/home_screen.dart';
import 'package:xera_task/ui/screens/splash/splash_screen.dart';

import 'repository/networks/services/http_overrides.dart';

void main() {
  NetworkHttpOverrides.setHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalSettingsBloc>(
          create: (ctx) => LocalSettingsBloc(),
        ),
      ],
      child: BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
          builder: (context, state) {
        return MaterialApp(
          title: 'X-era Task',
          themeMode: state.settings.theme,
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: LocalesConstants.localeResolutionCallback,
          locale: state.settings.locale,
          initialRoute: SplashScreen.id,
          routes: {
            HomeScreen.id: (context) => const HomeScreen(),
            SplashScreen.id: (context) => const SplashScreen()
          },
        );
      }),
    );
  }
}
