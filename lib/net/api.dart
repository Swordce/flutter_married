
class Api {
  static const String baseUrl = "http://101.200.232.158";
  static const String smsCodeUrl = "/api/account/send-code";
  static const String registerUrl = "/api/account/register";
  static const String loginUrl = "/api/account/login";
  static const String delAccountUrl = "/api/account/del-account";

  //vip
  static const String packageListUrl = '/api/pay/package-list';
  static const String rechargeUrl = '/api/pay/recharge';

  //user
  static const String userInfo = '/api/user/get-user-info';
  static const String editUserInfo = '/api/user/modify-user-info';
  static const String editUserPhone ='/api/user/modify-user-phone';
  static const String editUserPwd ='/api/user/modify-user-pwd';
  static const String userSignin ='/api/user/sign-in';
  static const String userTaskList ='/api/user/taskList';

}