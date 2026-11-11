import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlick/const/color.dart';
import 'package:qlick/ui/splash_screen/splash_secreen.dart';

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        scaffoldBackgroundColor: background,
        primaryColor: surface,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.rubik(
            color: textPrimary,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.rubik(
            color: textPrimary,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: GoogleFonts.rubik(
            color: textPrimary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: darkBackground,
        primaryColor: darkTextPrimary,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.rubik(
            color: darkTextPrimary,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.rubik(
            color: darkTextPrimary,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: GoogleFonts.rubik(
            color: darkTextPrimary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: SplashSecreen(),
    );
  }
}
