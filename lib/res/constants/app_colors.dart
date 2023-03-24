import 'package:flutter/material.dart';

class AppColors {
  static const Color primeryColors = Color(0xff035442);
  static const Color secondryColors = Color(0xff4dffd6);
  static const Color backgroundColor = Colors.black;
  static const Color authTextColor = Colors.white;
  static const Color textColor = Colors.white;
  static const Color preffixIconColor = Colors.white;
  static const Color suffixIconColor = Colors.white;
  static const Color borderColor = Colors.redAccent;
  static const Color enableBorderColor = Colors.white;
  static const Color authButtonColor = Colors.redAccent;
  static const Color authCheckColor = Colors.redAccent;
  static const Color scaffoldBackgroundColor = Colors.black;

  static const double defaultPadding = 20.0;

  static const LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primeryColors,
      secondryColors,
    ],
  );

  static List<BoxShadow> catagoriesShadow() => [
        BoxShadow(
          color: AppColors.primeryColors.withOpacity(0.5),
          offset: const Offset(0, 3),
          blurRadius: defaultPadding / 2,
          spreadRadius: 5,
        ),
        BoxShadow(
          color: AppColors.secondryColors.withOpacity(0.5),
          offset: const Offset(0, -3),
          blurRadius: defaultPadding / 2,
          spreadRadius: 5,
        ),
      ];
  static List<BoxShadow> productCardShadow() => [
        BoxShadow(
          color: Colors.white.withOpacity(0.6),
          offset: const Offset(3, 7),
          blurRadius: 10,
          spreadRadius: 6,
        ),
      ];

  static TextStyle drawerTitleTheme() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static ThemeData themeData(BuildContext context) => ThemeData(
        secondaryHeaderColor: secondryColors,
        primaryColor: primeryColors,
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: AppColors.secondryColors,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: secondryColors,
          elevation: 5,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.primeryColors,
              displayColor: AppColors.primeryColors,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(secondryColors),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: primeryColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: secondryColors,
          selectedItemColor: primeryColors,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
