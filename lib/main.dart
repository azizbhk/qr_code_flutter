import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Color(0xFFF5ECE3), // Light tan background for warmth
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF6D4C41), // Darker brown for AppBar
          titleTextStyle: TextStyle(
            color: Colors.white, // White text on AppBar
            fontSize: 22,
            fontWeight: FontWeight.w700, // Bolder font for a luxurious look
            letterSpacing: 1.2,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 5, // Slight shadow for depth
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xFF4E342E), // Dark chocolate brown text
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF5D4037), // Slightly lighter brown for medium text
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            color: Color(0xFF3E2723), // Very dark brown for headlines
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF8D6E63), // Warm brown for buttons
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded edges for buttons
          ),
        ),
        cardTheme: CardTheme(
          color: Color(0xFFF1EDE2), // Light beige for cards
          shadowColor: Colors.brown.withOpacity(0.3),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF5D4037), // Warm brown icons
        ),
      ),
      home: MainScreen(),
    );
  }
}
