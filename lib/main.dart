import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';
final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 180, 11, 57),
  ),

  textTheme: GoogleFonts.latoTextTheme(),
  scaffoldBackgroundColor: Colors.black,
);

void main(){
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}