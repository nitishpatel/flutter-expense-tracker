import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          child: Text(
            'Manage',
            style: GoogleFonts.montserrat(),
          ),
        ),
        ListTile(
          leading: Icon(Icons.category),
        )
      ],
    );
  }
}
