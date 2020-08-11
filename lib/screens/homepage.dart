import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/screens/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MenuBar(),
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
