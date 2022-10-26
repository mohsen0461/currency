import 'package:flutter/material.dart';

class CurrencyThemes {
  static final darkTheme = ThemeData(
      tabBarTheme: const TabBarTheme(labelStyle: TextStyle(color: Colors.white)),
      indicatorColor: Colors.black,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.black),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      textTheme: TextTheme(),
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: const ColorScheme.dark());

  static final lightTheme = ThemeData(
    tabBarTheme: TabBarTheme(labelStyle: TextStyle(color: Colors.blue)),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Colors.white),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white, indicatorColor: Colors.white),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle:
            TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    textTheme: TextTheme(),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}
