class Category {
  int _id;
  String _title;
  Category(this._title);
  Category.withId(this._id, this._title);

  String get title => _title;
  set title(String value) {
    _title = value;
  }

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    return map;
  }

  Category.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
  }
}
