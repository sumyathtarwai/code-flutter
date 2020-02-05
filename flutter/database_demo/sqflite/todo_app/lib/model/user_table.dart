class Users {
  int _id;
  String _name;
  String _password;

  Users(this._name, this._password);

// as field are private, re-write getter
  String get name => _name;
  String get password => _password;
  int get id => _id;

// named constructor
  Users.mapper(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._password = obj['password'];
  }

  Users.mapMapper(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._password = map['password'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['password'] = _password;
    return map;
  }
}
