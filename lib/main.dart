import 'package:components/src/routes/route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
    const Locale('en'), // English
    const Locale('es'), // Hebrew
    // ... other locales the app supports
  ],
        debugShowCheckedModeBanner: false,
        title: 'Componentes App',
        // home: Scaffold(
        //   body: HomePage(),
        // ),
        initialRoute: '/',
        routes: getApplicationRoutes());
  }
}
