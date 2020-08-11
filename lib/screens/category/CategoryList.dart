import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/databaseHelper/Category.dart';
import 'package:money_manager/databaseHelper/category_database_helper.dart';
import 'package:money_manager/screens/category/CategoryDetail.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    updateListView();
  }

  bool isComplete;
  static Color mainUiColor = Color(0xFFb92b27);
  CategoryDatabaseHelper databaseHelper = CategoryDatabaseHelper();
  List<Category> categoryList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category List"),
        centerTitle: true,
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigateToDetail(Category(''), 'Add Ledger');
        },
      ),
    );
  }

  void navigateToDetail(Category category, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CategoryDetail(category, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initalizeDatabase();
    dbFuture.then((database) {
      Future<List<Category>> categoryListFuture =
          databaseHelper.getCategoryList();
      categoryListFuture.then((categoryList) {
        setState(() {
          this.categoryList = categoryList;
          this.count = categoryList.length;
        });
      });
    });
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 10.0,
            child: ListTile(
              title: Text(this.categoryList[position].title.toUpperCase(),
                  style: GoogleFonts.montserrat(fontSize: 20.0)),
              trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    navigateToDetail(
                        this.categoryList[position], 'Edit Ledger');
                  }),
            ),
          ),
        );
      },
    );
  }
}
