class SignTaskBean {
  String _msg;
  int _code;
  Data _data;

  SignTaskBean({String msg, int code, Data data}) {
    this._msg = msg;
    this._code = code;
    this._data = data;
  }

  String get msg => _msg;
  set msg(String msg) => _msg = msg;
  int get code => _code;
  set code(int code) => _code = code;
  Data get data => _data;
  set data(Data data) => _data = data;

  SignTaskBean.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
    _code = json['code'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this._msg;
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  int _signDay;
  int _signTask;
  int _bindingPhone;
  int _bindingWx;
  int _supplementData;
  int _releaseNews;
  int _authName;
  int _authHouse;
  int _authCar;

  Data(
      {int signDay,
        int signTask,
        int bindingPhone,
        int bindingWx,
        int supplementData,
        int releaseNews,
        int authName,
        int authHouse,
        int authCar}) {
    this._signDay = signDay;
    this._signTask = signTask;
    this._bindingPhone = bindingPhone;
    this._bindingWx = bindingWx;
    this._supplementData = supplementData;
    this._releaseNews = releaseNews;
    this._authName = authName;
    this._authHouse = authHouse;
    this._authCar = authCar;
  }

  int get signDay => _signDay;
  set signDay(int signDay) => _signDay = signDay;
  int get signTask => _signTask;
  set signTask(int signTask) => _signTask = signTask;
  int get bindingPhone => _bindingPhone;
  set bindingPhone(int bindingPhone) => _bindingPhone = bindingPhone;
  int get bindingWx => _bindingWx;
  set bindingWx(int bindingWx) => _bindingWx = bindingWx;
  int get supplementData => _supplementData;
  set supplementData(int supplementData) => _supplementData = supplementData;
  int get releaseNews => _releaseNews;
  set releaseNews(int releaseNews) => _releaseNews = releaseNews;
  int get authName => _authName;
  set authName(int authName) => _authName = authName;
  int get authHouse => _authHouse;
  set authHouse(int authHouse) => _authHouse = authHouse;
  int get authCar => _authCar;
  set authCar(int authCar) => _authCar = authCar;

  Data.fromJson(Map<String, dynamic> json) {
    _signDay = json['signDay'];
    _signTask = json['signTask'];
    _bindingPhone = json['bindingPhone'];
    _bindingWx = json['bindingWx'];
    _supplementData = json['supplementData'];
    _releaseNews = json['releaseNews'];
    _authName = json['authName'];
    _authHouse = json['authHouse'];
    _authCar = json['authCar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signDay'] = this._signDay;
    data['signTask'] = this._signTask;
    data['bindingPhone'] = this._bindingPhone;
    data['bindingWx'] = this._bindingWx;
    data['supplementData'] = this._supplementData;
    data['releaseNews'] = this._releaseNews;
    data['authName'] = this._authName;
    data['authHouse'] = this._authHouse;
    data['authCar'] = this._authCar;
    return data;
  }
}
