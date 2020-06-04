class Topic {
  int _id;
  String _korCatName;
  String _engCatName;
  List<String> _korWord;
  List<String> _engWord;
  int _order;

  Topic(this._id, this._korCatName, this._engCatName, this._korWord, this._engWord, this._order);
  int get id => _id;
  String get korName => _korCatName;
  String get engName => _engCatName;
  List<String> get korWord => _korWord;
  List<String> get engWord => _engWord;
  int get order => _order;
}