class UserInfoBean {
  String _msg;
  int _code;
  Data _data;

  UserInfoBean({String msg, int code, Data data}) {
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

  UserInfoBean.fromJson(Map<String, dynamic> json) {
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
  BasicInfo _basicInfo;
  MoreInfo _moreInfo;
  MateIntention _mateIntention;
  AuthInfo _authInfo;

  Data(
      {BasicInfo basicInfo,
        MoreInfo moreInfo,
        MateIntention mateIntention,
        AuthInfo authInfo}) {
    this._basicInfo = basicInfo;
    this._moreInfo = moreInfo;
    this._mateIntention = mateIntention;
    this._authInfo = authInfo;
  }

  BasicInfo get basicInfo => _basicInfo;
  set basicInfo(BasicInfo basicInfo) => _basicInfo = basicInfo;
  MoreInfo get moreInfo => _moreInfo;
  set moreInfo(MoreInfo moreInfo) => _moreInfo = moreInfo;
  MateIntention get mateIntention => _mateIntention;
  set mateIntention(MateIntention mateIntention) =>
      _mateIntention = mateIntention;
  AuthInfo get authInfo => _authInfo;
  set authInfo(AuthInfo authInfo) => _authInfo = authInfo;

  Data.fromJson(Map<String, dynamic> json) {
    _basicInfo = json['basicInfo'] != null
        ? new BasicInfo.fromJson(json['basicInfo'])
        : null;
    _moreInfo = json['moreInfo'] != null
        ? new MoreInfo.fromJson(json['moreInfo'])
        : null;
    _mateIntention = json['mateIntention'] != null
        ? new MateIntention.fromJson(json['mateIntention'])
        : null;
    _authInfo = json['authInfo'] != null
        ? new AuthInfo.fromJson(json['authInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._basicInfo != null) {
      data['basicInfo'] = this._basicInfo.toJson();
    }
    if (this._moreInfo != null) {
      data['moreInfo'] = this._moreInfo.toJson();
    }
    if (this._mateIntention != null) {
      data['mateIntention'] = this._mateIntention.toJson();
    }
    if (this._authInfo != null) {
      data['authInfo'] = this._authInfo.toJson();
    }
    return data;
  }
}

class BasicInfo {
  String _headPortrait;
  String _introduction;
  String _picture;
  String _weChat;
  String _phone;
  int _member;
  String _nickName;
  String _sex;
  int _age;
  String _hometown;
  String _place;
  String _maritalStatus;
  String _profession;
  double _height;
  String _education;
  double _monthlyIncome;

  BasicInfo(
      {String headPortrait,
        String introduction,
        String picture,
        String weChat,
        String phone,
        int member,
        String nickName,
        String sex,
        int age,
        String hometown,
        String place,
        String maritalStatus,
        String profession,
        double height,
        String education,
        double monthlyIncome}) {
    this._headPortrait = headPortrait;
    this._introduction = introduction;
    this._picture = picture;
    this._weChat = weChat;
    this._phone = phone;
    this._member = member;
    this._nickName = nickName;
    this._sex = sex;
    this._age = age;
    this._hometown = hometown;
    this._place = place;
    this._maritalStatus = maritalStatus;
    this._profession = profession;
    this._height = height;
    this._education = education;
    this._monthlyIncome = monthlyIncome;
  }

  String get headPortrait => _headPortrait;
  set headPortrait(String headPortrait) => _headPortrait = headPortrait;
  String get introduction => _introduction;
  set introduction(String introduction) => _introduction = introduction;
  String get picture => _picture;
  set picture(String picture) => _picture = picture;
  String get weChat => _weChat;
  set weChat(String weChat) => _weChat = weChat;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  int get member => _member;
  set member(int member) => _member = member;
  String get nickName => _nickName;
  set nickName(String nickName) => _nickName = nickName;
  String get sex => _sex;
  set sex(String sex) => _sex = sex;
  int get age => _age;
  set age(int age) => _age = age;
  String get hometown => _hometown;
  set hometown(String hometown) => _hometown = hometown;
  String get place => _place;
  set place(String place) => _place = place;
  String get maritalStatus => _maritalStatus;
  set maritalStatus(String maritalStatus) => _maritalStatus = maritalStatus;
  String get profession => _profession;
  set profession(String profession) => _profession = profession;
  double get height => _height;
  set height(double height) => _height = height;
  String get education => _education;
  set education(String education) => _education = education;
  double get monthlyIncome => _monthlyIncome;
  set monthlyIncome(double monthlyIncome) => _monthlyIncome = monthlyIncome;

  BasicInfo.fromJson(Map<String, dynamic> json) {
    _headPortrait = json['headPortrait'];
    _introduction = json['introduction'];
    _picture = json['picture'];
    _weChat = json['weChat'];
    _phone = json['phone'];
    _member = json['member'];
    _nickName = json['nickName'];
    _sex = json['sex'];
    _age = json['age'];
    _hometown = json['hometown'];
    _place = json['place'];
    _maritalStatus = json['maritalStatus'];
    _profession = json['profession'];
    _height = json['height'];
    _education = json['education'];
    _monthlyIncome = json['monthlyIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headPortrait'] = this._headPortrait;
    data['introduction'] = this._introduction;
    data['picture'] = this._picture;
    data['weChat'] = this._weChat;
    data['phone'] = this._phone;
    data['member'] = this._member;
    data['nickName'] = this._nickName;
    data['sex'] = this._sex;
    data['age'] = this._age;
    data['hometown'] = this._hometown;
    data['place'] = this._place;
    data['maritalStatus'] = this._maritalStatus;
    data['profession'] = this._profession;
    data['height'] = this._height;
    data['education'] = this._education;
    data['monthlyIncome'] = this._monthlyIncome;
    return data;
  }
}

class MoreInfo {
  String _carPurchase;
  String _housePurchase;
  String _baby;
  String _giveBirth;
  String _marry;

  MoreInfo(
      {String carPurchase,
        String housePurchase,
        String baby,
        String giveBirth,
        String marry}) {
    this._carPurchase = carPurchase;
    this._housePurchase = housePurchase;
    this._baby = baby;
    this._giveBirth = giveBirth;
    this._marry = marry;
  }

  String get carPurchase => _carPurchase;
  set carPurchase(String carPurchase) => _carPurchase = carPurchase;
  String get housePurchase => _housePurchase;
  set housePurchase(String housePurchase) => _housePurchase = housePurchase;
  String get baby => _baby;
  set baby(String baby) => _baby = baby;
  String get giveBirth => _giveBirth;
  set giveBirth(String giveBirth) => _giveBirth = giveBirth;
  String get marry => _marry;
  set marry(String marry) => _marry = marry;

  MoreInfo.fromJson(Map<String, dynamic> json) {
    _carPurchase = json['carPurchase'];
    _housePurchase = json['housePurchase'];
    _baby = json['baby'];
    _giveBirth = json['giveBirth'];
    _marry = json['marry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carPurchase'] = this._carPurchase;
    data['housePurchase'] = this._housePurchase;
    data['baby'] = this._baby;
    data['giveBirth'] = this._giveBirth;
    data['marry'] = this._marry;
    return data;
  }
}

class MateIntention {
  String _claimCarPurchase;
  String _claimPlace;
  String _claimMaritalStatus;
  String _claimProfession;
  String _claimHeight;
  String _claimEducation;
  String _claimMonthlyIncome;

  MateIntention(
      {String claimCarPurchase,
        String claimPlace,
        String claimMaritalStatus,
        String claimProfession,
        String claimHeight,
        String claimEducation,
        String claimMonthlyIncome}) {
    this._claimCarPurchase = claimCarPurchase;
    this._claimPlace = claimPlace;
    this._claimMaritalStatus = claimMaritalStatus;
    this._claimProfession = claimProfession;
    this._claimHeight = claimHeight;
    this._claimEducation = claimEducation;
    this._claimMonthlyIncome = claimMonthlyIncome;
  }

  String get claimCarPurchase => _claimCarPurchase;
  set claimCarPurchase(String claimCarPurchase) =>
      _claimCarPurchase = claimCarPurchase;
  String get claimPlace => _claimPlace;
  set claimPlace(String claimPlace) => _claimPlace = claimPlace;
  String get claimMaritalStatus => _claimMaritalStatus;
  set claimMaritalStatus(String claimMaritalStatus) =>
      _claimMaritalStatus = claimMaritalStatus;
  String get claimProfession => _claimProfession;
  set claimProfession(String claimProfession) =>
      _claimProfession = claimProfession;
  String get claimHeight => _claimHeight;
  set claimHeight(String claimHeight) => _claimHeight = claimHeight;
  String get claimEducation => _claimEducation;
  set claimEducation(String claimEducation) => _claimEducation = claimEducation;
  String get claimMonthlyIncome => _claimMonthlyIncome;
  set claimMonthlyIncome(String claimMonthlyIncome) =>
      _claimMonthlyIncome = claimMonthlyIncome;

  MateIntention.fromJson(Map<String, dynamic> json) {
    _claimCarPurchase = json['claimCarPurchase'];
    _claimPlace = json['claimPlace'];
    _claimMaritalStatus = json['claimMaritalStatus'];
    _claimProfession = json['claimProfession'];
    _claimHeight = json['claimHeight'];
    _claimEducation = json['claimEducation'];
    _claimMonthlyIncome = json['claimMonthlyIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['claimCarPurchase'] = this._claimCarPurchase;
    data['claimPlace'] = this._claimPlace;
    data['claimMaritalStatus'] = this._claimMaritalStatus;
    data['claimProfession'] = this._claimProfession;
    data['claimHeight'] = this._claimHeight;
    data['claimEducation'] = this._claimEducation;
    data['claimMonthlyIncome'] = this._claimMonthlyIncome;
    return data;
  }
}

class AuthInfo {
  int _realNameState;
  int _realHouseState;
  int _realCarState;

  AuthInfo({int realNameState, int realHouseState, int realCarState}) {
    this._realNameState = realNameState;
    this._realHouseState = realHouseState;
    this._realCarState = realCarState;
  }

  int get realNameState => _realNameState;
  set realNameState(int realNameState) => _realNameState = realNameState;
  int get realHouseState => _realHouseState;
  set realHouseState(int realHouseState) => _realHouseState = realHouseState;
  int get realCarState => _realCarState;
  set realCarState(int realCarState) => _realCarState = realCarState;

  AuthInfo.fromJson(Map<String, dynamic> json) {
    _realNameState = json['realNameState'];
    _realHouseState = json['realHouseState'];
    _realCarState = json['realCarState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['realNameState'] = this._realNameState;
    data['realHouseState'] = this._realHouseState;
    data['realCarState'] = this._realCarState;
    return data;
  }
}
