import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/bloc/search/search_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/utilities/localizations/locales_constants.dart';
import 'package:xera_task/models/utilities/themes/theme_dark.dart';
import 'package:xera_task/models/utilities/themes/theme_light.dart';
import 'package:xera_task/repository/networks/api_clients/movies/movies_api_client.dart';
import 'package:xera_task/ui/screens/main_navigation/main_navigation.dart';

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
        BlocProvider<SearchBloc>(
          create: (ctx) => SearchBloc(
            moviesApiClient: MoviesApiClient(),
          ),
        )
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
          initialRoute: MainNavigation.id,
          routes: {
            MainNavigation.id: (context) => const MainNavigation(),
          },
        );
      }),
    );
  }
}
