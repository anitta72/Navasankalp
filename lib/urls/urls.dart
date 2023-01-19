import 'dart:developer';

String loginurl = "https://dcc.gitdr.com/api/userlogin";
String userprofil = 'https://dcc.gitdr.com/api/userprofile';
String usersUrl = 'https://dcc.gitdr.com/api/blocks';
String payment = 'https://dcc.gitdr.com/api/pay';
String userprofileget({required String phone}) {
  log(phone);
  return 'https://dcc.gitdr.com/api/userprofile?phone=$phone';
}

String paymenthistoryget({required String phone}) {
  return 'https://dcc.gitdr.com/api/history?phone=$phone';
}
