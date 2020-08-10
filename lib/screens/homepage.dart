import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Add Expense',
            style: GoogleFonts.montserrat(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
