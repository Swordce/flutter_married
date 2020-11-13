class VIPProductBean {
  String _msg;
  int _code;
  List<Data> _data;

  VIPProductBean({String msg, int code, List<Data> data}) {
    this._msg = msg;
    this._code = code;
    this._data = data;
  }

  String get msg => _msg;
  set msg(String msg) => _msg = msg;
  int get code => _code;
  set code(int code) => _code = code;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;

  VIPProductBean.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
    _code = json['code'];
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this._msg;
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String _id;
  String _name;
  double _money;
  String _describeInfo;

  Data({String id, String name, double money, String describeInfo}) {
    this._id = id;
    this._name = name;
    this._money = money;
    this._describeInfo = describeInfo;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  double get money => _money;
  set money(double money) => _money = money;
  String get describeInfo => _describeInfo;
  set describeInfo(String describeInfo) => _describeInfo = describeInfo;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _money = json['money'];
    _describeInfo = json['describeInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['money'] = this._money;
    data['describeInfo'] = this._describeInfo;
    return data;
  }
}
