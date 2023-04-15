// ignore_for_file: file_names

class ApiUrls {
  static const String baseUrl = 'http://bluecoldapp.com:8080/newcold/';
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
  static const String aboutUsurl = "http://www.bluecoldref.com/About-Us.aspx";
  static const String contactUsUrl = "http://www.bluecoldref.com/Contact-Us.aspx";
}
