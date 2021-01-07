import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  String get uid => _sharedPrefs.getString("uid") ?? "";

  setuid(String value) {
    _sharedPrefs.setString("uid", value);
  }

  deleteUid() {
    _sharedPrefs.remove("uid");
  }
}

final sharedPrefs = SharedPrefs();
