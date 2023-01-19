class LoginControll {
  String? phonenumber;

  LoginControll({this.phonenumber});
  Map<String, String> toJson() {
    return {
      "phone": ' $phonenumber',
      "password": '1234',
    };
  }
}
