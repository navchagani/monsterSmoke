import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MonsterThemes {
  static ThemeData get themeLight => ThemeData(
      useMaterial3: true,
      focusColor: Colors.grey.shade200,
      canvasColor: Colors.grey.shade100,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          toolbarHeight: 80,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color.fromARGB(255, 241, 239, 239),
          actionsIconTheme: const IconThemeData(color: Colors.black38),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black45,
          ),
          centerTitle: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: const Color(0xFF647a67).withOpacity(0.1),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: const Color.fromARGB(255, 237, 244, 255),
          )),
      textTheme: TextTheme(
        displaySmall: const TextStyle(
            fontSize: 14,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic),
        displayMedium: const TextStyle(
            fontSize: 14, color: Colors.black45, fontWeight: FontWeight.normal),
        displayLarge: const TextStyle(
            fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w700),
        bodyMedium: const TextStyle(
            fontSize: 14, color: Colors.black45, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(
            fontSize: 14,
            color: Colors.black45.withOpacity(0.5),
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal),
        bodyLarge: const TextStyle(
            fontSize: 14, color: Colors.black45, fontWeight: FontWeight.bold),
        headlineLarge: const TextStyle(
          fontSize: 15,
          color: Colors.black45,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: const TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
        headlineSmall: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic),
        titleLarge: const TextStyle(
            fontSize: 18, color: Colors.black45, fontWeight: FontWeight.bold),
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF647a67),
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.deepOrange,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black45),
      splashColor: Colors.purple.withOpacity(0.05),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.black45.withOpacity(0.5),
            fontWeight: FontWeight.w300),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.black45.withOpacity(0.05),
        focusColor: Colors.purple.withOpacity(0.08),
        hoverColor: Colors.purple.withOpacity(0.08),
      ),
      snackBarTheme: const SnackBarThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        contentTextStyle: TextStyle(
            fontSize: 12, color: Colors.black45, fontWeight: FontWeight.w600),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade100,
          selectedIconTheme: const IconThemeData(
            color: Colors.purple,
            size: 40,
            opacity: 1.0,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black45.withOpacity(0.25),
            size: 24,
            opacity: 0.5,
          ),
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black45.withOpacity(0.25),
          selectedLabelStyle: const TextStyle(color: Colors.purple),
          unselectedLabelStyle: const TextStyle(color: Colors.black45),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        backgroundColor: Colors.transparent,
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.purple)),
              splashFactory: InkSplash.splashFactory)),
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
      ),
      iconTheme:
          IconThemeData(color: Colors.black45.withOpacity(0.45), size: 24),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(100.0)),
          labelPadding: const EdgeInsets.all(8.0),
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: const TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, color: Colors.black38)),
      bottomSheetTheme: BottomSheetThemeData(
          surfaceTintColor: Colors.grey.shade100,
          backgroundColor: Colors.grey.shade100,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)))),
      toggleButtonsTheme: const ToggleButtonsThemeData(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          focusColor: Colors.purple,
          selectedColor: Colors.black45,
          fillColor: Colors.purple),
      chipTheme: ChipThemeData(
        side: BorderSide.none,
        backgroundColor: Colors.purple.withOpacity(0.1),
        disabledColor: Colors.black45.withOpacity(0.03),
        surfaceTintColor: Colors.black45.withOpacity(0.1),
        selectedColor: Colors.purple,
        iconTheme: const IconThemeData(size: 14),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            side: BorderSide.none),
        labelPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
        secondarySelectedColor: Colors.black45,
        labelStyle: const TextStyle(
            fontSize: 14, color: Colors.black45, fontWeight: FontWeight.w400),
        secondaryLabelStyle: const TextStyle(
            fontSize: 14, color: Colors.black45, fontWeight: FontWeight.w400),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Colors.black45.withOpacity(0.05),
        selectedIconTheme: const IconThemeData(
          color: Colors.purple,
        ),
        unselectedIconTheme:
            IconThemeData(color: Colors.white.withOpacity(0.45), size: 20),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
              surfaceTintColor: const MaterialStatePropertyAll(Colors.purple),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.purple;
                  }
                  return Colors.transparent;
                },
              ),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0)),
              side: const MaterialStatePropertyAll(
                  BorderSide(color: Colors.black45)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))))));
}
