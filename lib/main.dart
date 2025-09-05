import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      themeMode: ThemeMode.light,
    ),
  );
}
