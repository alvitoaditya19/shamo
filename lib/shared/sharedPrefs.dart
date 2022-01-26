import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;


  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

//auth
  bool get loggedIn => _sharedPrefs?.getBool('loggedIn') ?? false;
  String get nik => _sharedPrefs.getString('nik') ?? "";
  String get token => _sharedPrefs.getString('token') ?? "";
  String get password => _sharedPrefs.getString('password') ?? "";
  String get versionCode => _sharedPrefs.getString('versionCode') ?? "1.0.5";
}

final sharedPrefs = SharedPrefs();