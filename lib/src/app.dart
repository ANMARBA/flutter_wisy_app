import 'package:flutter/material.dart';

import 'package:flutter_wisy_app/src/localization/string_hardcoded.dart';
import 'package:flutter_wisy_app/src/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (_) => 'Wisy App'.hardcoded,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFECEDF1),
          foregroundColor: Color(0xFF3C3D40),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC8B99E),
            foregroundColor: Colors.white,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFC8B99E),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
