import 'package:auto_route/auto_route.dart';
import 'package:core/app_dependencies/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_developer/app/app/ui/main_screen.dart';

import 'app/app/extensions/extensions.dart';
import 'app/app/provider/main_provider.dart';
import 'app/app/resources/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppDependencies.instance.setDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainProvider(
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: Constants.appTitle,
        home: MainScreen(),
      ),
    );
  }
}
