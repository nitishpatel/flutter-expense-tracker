import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/databaseHelper/Category.dart';
import 'package:money_manager/databaseHelper/category_database_helper.dart';

class CategoryDetail extends StatefulWidget {
  final String appBarTitle;
  final Category category;
  CategoryDetail(this.category, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return CategoryDetailState(this.category, this.appBarTitle);
  }
}

class CategoryDetailState extends State<CategoryDetail> {
  Category category;
  String appBarTitle;
  CategoryDatabaseHelper helper = CategoryDatabaseHelper();
  CategoryDetailState(this.category, this.appBarTitle);
  TextEditingController titleController = TextEditingController();
  void updateTitle() {
    category.title = titleController.text;
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void _save() async {
    moveToLastScreen();
    int result;
    if (category.id != null) {
      result = await helper.updateNote(category);
    } else {
      result = await helper.insertNote(category);
    }

    if (result != 0) {
      _showAlertDialog("Status", "Note Saved Successfully");
    } else {
      _showAlertDialog("Status", "Problem Saving Note");
    }
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _delete() async {
    moveToLastScreen();
    if (category.id == null) {
      _showAlertDialog("status", "First Add A Category");
      return;
    }

    int result = await helper.deleteNote(category.id);
    if (result != 0) {
      _showAlertDialog("Status", "Category Deleted Successfully");
    } else {
      _showAlertDialog("Status", "Problem Deleting Note");
    }
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = category.title;
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: moveToLastScreen,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              // Second Element
              Padding(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
                child: TextField(
                  controller: titleController,
                  onChanged: (value) {
                    updateTitle();
                  },
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "Ledger Name",
                      labelStyle:
                          GoogleFonts.montserrat(color: Color(0xFF457b9d)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF457b9d)),
                          borderRadius: BorderRadius.circular(15.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF457b9d)),
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              ),

              // Fourth Element
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xFF457b9d),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Save button clicked");
                            _save();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xFF1d3557),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            _delete();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
