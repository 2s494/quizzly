import 'package:flutter/material.dart';
import 'package:quizzly/services/l10n/app_localizations.dart';
import 'package:quizzly/views/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RunApp extends StatefulWidget {
  const RunApp({Key? key}) : super(key: key);

  @override
  State<RunApp> createState() => _RunAppState();
}

class _RunAppState extends State<RunApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Localizations App",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // supportedLocales: const [
      //   Locale('en'),
      //   Locale('uz'),
      //   Locale('ru')
      // ],
      debugShowCheckedModeBanner: false,
      locale: const Locale('uz'),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
     
    );
  }
}
