// ignore_for_file: file_names

class ApiUrls {
  static const String baseUrl = 'http://aetheria.zymofar.com:8082/bcold/';
  static const String loginEmailPassword = 'user/microCool/login';
  static const String validateOtp = 'user/microCool/validateOtp';
  static const String airCoolers = 'airCoolers/calculate';
  static const String login = 'user/add'; // login with number to get otp
  static const String otpResend = "resendOTP";
  static const String report = "report/info?id=";
  static const String updateUser = "user/update_user";
  static const String updateUserImage = "img/image";
  static const String updateLocation = "location";
  static const String updateUserImage1 = "img/imageByte";
  static const String updatePushToken = "user/updateDevice";
  static const String notificationList = "notification/getUserNotification";
  static const String notificationReadStatusUpdate = "notification/update";
  static const String deleteNotification = "notification/deleteNotification";
  static const String countNotification = "notification/count/read/status";
  static const String updateUserActiveStatus = "user/isActive";
  static const String updateUserUpdatePDf = "updatePdfInfo";
  static const String aboutUsurl = "https://www.microcoils.in/about-us/";
  static const String contactUsUrl = "https://www.microcoils.in/support/";
}
