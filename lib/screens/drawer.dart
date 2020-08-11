import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/databaseHelper/Category.dart';
import 'package:money_manager/screens/category/CategoryDetail.dart';
import 'package:money_manager/screens/category/CategoryList.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          drawerHeader(),
          ListTile(
            leading: Icon(Icons.category),
            title: Text("Add Category"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CategoryDetail(Category(''), 'Add Category')));
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("View Categories"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryList()));
            },
          ),
        ],
      ),
    );
  }
}

Widget drawerHeader() {
  return ShaderMask(
    shaderCallback: (rect) {
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.purple, Colors.transparent],
      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
    },
    blendMode: BlendMode.dstIn,
    child: Image.network(
      'https://images.unsplash.com/photo-1579621970795-87facc2f976d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      fit: BoxFit.contain,
    ),
  );
}
