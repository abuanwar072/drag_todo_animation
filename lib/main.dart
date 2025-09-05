import 'package:drag_todo_animation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
