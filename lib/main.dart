import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s5s5/features/home/presentation/views/home.dart';

void main() {
  runApp(const S5S5App());
}

class S5S5App extends StatelessWidget {
  const S5S5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S5S5',
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      home: const HomeView(),
    );
  }
}
