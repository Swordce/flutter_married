class CountryCode {
  String cn;
  String en;
  String phoneCode;

  CountryCode({this.cn, this.en, this.phoneCode});

  CountryCode.fromJson(Map<String, dynamic> json) {
    cn = json['cn'];
    en = json['en'];
    phoneCode = json['phone_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cn'] = this.cn;
    data['en'] = this.en;
    data['phone_code'] = this.phoneCode;
    return data;
  }
}
