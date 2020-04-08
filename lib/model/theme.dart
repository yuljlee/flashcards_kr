class Theme {
  int _id;
  String _korName;
  String _engName;
  int _order;

  Theme(this._id, this._korName, this._engName, this._order);
  int get id => _id;
  String get korName => _korName;
  String get engName => _engName;
  int get order => _order;
}