import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _sharedPref;
  init() async {
    _sharedPref ??= await SharedPreferences.getInstance();
  }

  //gettter
  bool get loggedIn => _sharedPref!.getBool('loggedIn') ?? false;
  String get id => _sharedPref!.getString('id') ?? "";
  String get email => _sharedPref!.getString('email') ?? "";
  String get name => _sharedPref!.getString('name') ?? "";
  String get company => _sharedPref!.getString('company') ?? "";
  String get number => _sharedPref!.getString('number') ?? "";
  String get address => _sharedPref!.getString('address') ?? "";
  String get photoUrl => _sharedPref!.getString('photoUrl') ?? "";
  String? get token => _sharedPref!.getString('authToken');

  //pdf inputs
  String? get customer => _sharedPref!.getString('customer');
  String? get jobReferance => _sharedPref!.getString('jobReferance');
  String? get roomName => _sharedPref!.getString('roomName');
  String? get emailId => _sharedPref!.getString('emailId');

  /// set pdf inputs

  setPdfInputs({
    required String customer,
    required String jobReference,
    required String roomName,
    required String emailId,
  }) {
    _sharedPref!.setString('customer', customer);
    _sharedPref!.setString('jobReference', jobReference);
    _sharedPref!.setString('roomName', roomName);
    _sharedPref!.setString('emailId', emailId);
  }

  ///Set as logged in
  setLoggedIn() {
    _sharedPref!.setBool('loggedIn', true);
  }

  /// Set as logged out
  setLoggedOut() {
    _sharedPref!.setBool('loggedIn', false);
    setAuthToken(token: "");
    // _sharedPref!.remove('authToken');
  }

  /// Set  user details
  setUserDetails({
    required String id,
    required String email,
    required String name,
    required String company,
    required String number,
    required String address,
    required String photoUrl,
  }) {
    _sharedPref!.setString('id', id);
    _sharedPref!.setString('email', email);
    _sharedPref!.setString('name', name);
    _sharedPref!.setString('company', company);
    _sharedPref!.setString('number', number);
    _sharedPref!.setString('address', address);
    _sharedPref!.setString('photoUrl', photoUrl);
  }

  ///set Auth token for the app
  setAuthToken({required String token}) {
    _sharedPref!.setString('authToken', token);
  }
}

final sharedPrefs = SharedPref();
