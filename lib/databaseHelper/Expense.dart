class Expense {
  int _id;
  String _title;
  String _description;
  String _category;
  String _mode;
  String _date;
  Expense(this._title, this._category, this._mode, this._date,
      [this._description]);
  Expense.withId(this._id, this._title, this._category, this._mode, this._date,
      [this._description]);
  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get category => _category;
  String get mode => _mode;
  String get date => _date;

  set id(int value) {
    this._id = value;
  }

  set title(String value) {
    this._title = value;
  }

  set description(String value) {
    this._description = value;
  }

  set category(String value) {
    this._category = value;
  }

  set mode(String value) {
    this._mode = value;
  }

  set date(String value) {
    this._date = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['category'] = _category;
    map['mode'] = _mode;
    map['date'] = _date;
    return map;
  }

  Expense.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._category = map['category'];
    this._mode = map['mode'];
    this._date = map['date'];
  }
}
