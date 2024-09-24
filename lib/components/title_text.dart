import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.input
  });

  final String input;

  @override
  Widget build(BuildContext context) {
    return Text(
      input, 
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 24,
      ),
    );
  }
}