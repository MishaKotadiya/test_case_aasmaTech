extension EmailValidator on String {
  bool isValidateEmail() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension PhoneValidator on String {
  bool isValidatePhone() {
    return RegExp(r"^[6-9][0-9]{9}$").hasMatch(this);
  }
}

extension AadharNumberValidator on String {
  bool isValidAadharNumber() {
    return RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$').hasMatch(this);
  }
}

extension PanCardValidator on String {
  bool isValidPanCardNo() {
    return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(this);
  }
}

extension DrivingLicenseValidator on String {
  bool isValidLicenseNo() {
    return RegExp(
        r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$')
        .hasMatch(this);
  }
}
