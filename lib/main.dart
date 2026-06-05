import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fruit_app/screens/fruit_type.dart';
import 'screens/home_screen.dart';
import 'screens/fruit_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      child: const FruitApp(),
    ),
  );
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,

      title: 'Fruitiverse',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/fruits': (context) =>  HomePage(),
      },
    );
  }
}
