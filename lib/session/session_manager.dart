import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{
  //=======================Member ID=======================
  Future<void> setMemberID(String member_id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("member_id", member_id);
  }

  Future<String> getMemberID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("member_id") ?? "";
  }

  Future<void> deleteMemberID() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("member_id");
  }

  //=======================Login Status=======================
  Future<void> setLoginStatus(bool login_status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login_status", login_status);
  }

  Future<bool> getLoginStatus() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("login_status") ?? false;
  }

  Future<void> deleteLoginStatus() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("login_status");
  }
}