class RegUtils {
  static bool regEmail(String email) {
    if (email.isEmpty) {
      return false;
    }
    return RegExp(
            r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
        .hasMatch(email);
  }

  static bool regPhone(String phoneNum) {
    if(phoneNum.isEmpty) {
      return false;
    }
    return RegExp(r"1[0-9]\d{9}$").hasMatch(phoneNum);
  }
}
