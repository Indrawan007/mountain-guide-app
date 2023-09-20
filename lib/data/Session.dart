
import 'package:mountain_guide_app/data/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  final Future<SharedPreferences> pref = SharedPreferences.getInstance();
  static const String KEY_EMAIL = "KEY_EMAIL";
  static const String KEY_NAMA = "KEY_NAMA";
  static const String KEY_ALAMAT = "KEY_ALAMAT";
  static const String KEY_UID = "KEY_UID";

  Future<void> updateUserData(User user) async {
    final SharedPreferences sharedPreferences = await pref;
    sharedPreferences.setString(KEY_EMAIL, user.email ?? "");
    sharedPreferences.setString(KEY_NAMA, user.nama ?? "");
    sharedPreferences.setString(KEY_ALAMAT, user.alamat ?? "");
    sharedPreferences.setString(KEY_UID, user.uid ?? "");
  }

  Future<void> remove() async {
    final SharedPreferences sharedPreferences = await pref;
    sharedPreferences.clear();
  }

  Future<String?> readUserEmail() async {
    final SharedPreferences sharedPreferences = await pref;
    return sharedPreferences.getString(KEY_EMAIL);
  }

  Future<String?> readUserNama() async {
    final SharedPreferences sharedPreferences = await pref;
    return sharedPreferences.getString(KEY_NAMA);
  }

  Future<String?> readUserAlamat() async {
    final SharedPreferences sharedPreferences = await pref;
    return sharedPreferences.getString(KEY_ALAMAT);
  }

  Future<String?> readUserUid() async {
    final SharedPreferences sharedPreferences = await pref;
    return sharedPreferences.getString(KEY_UID);
  }
}