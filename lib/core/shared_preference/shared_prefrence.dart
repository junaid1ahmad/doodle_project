import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../session/session_data.dart';


const String session = 'session';
const String selectedId = 'selected_id';


const String location = 'location';
const String localeLanguage = 'locale_language';
const String role = 'user_role';
const String userHash = 'user_hash';
const String mPinSetup = 'm_pin_setup';
const String mPinActive = 'm_pin_active';
const String defaultLogin = 'default_login';
const String userId = 'user_id';
const String parentId = 'parent_id';
const String fcmToken = 'fcm_token';
const String userLogin = 'user_login';
const String fingerprintActive = 'fingerprint_active';
const String fingerprintAvailable = 'fingerprint_available';

class MySharedPrefrence {
  static final MySharedPrefrence _mySharedPrefrence =
      MySharedPrefrence._internal();

  MySharedPrefrence._internal();

  factory MySharedPrefrence() {
    return _mySharedPrefrence;
  }

  Future<bool> getSessionData() async {
    final myPrefs = await SharedPreferences.getInstance();
    ///////////////////////////////////////////////////////////////////////////
    ///    For getting the session data of user on opening the application
    //////////////////////////////////////////////////////////////////////////
    ///
    if (myPrefs.getString(session) != null) {
      SessionData.fromJson(jsonDecode(myPrefs.getString(session) ?? '{}'));
    }

    return myPrefs.containsKey(session);
  }

  Future<void> setLocale(Locale locale) async {
    final myPrefs = await SharedPreferences.getInstance();
    debugPrint(locale.languageCode.toString());
    await myPrefs.setString(localeLanguage, locale.languageCode.toString());
  }

  Future<void> setUserHash(String userHash) async {
    final myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setString(userHash, userHash);
  }

  Future<String> getUserHash() async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(userHash) ?? '';
  }

  Future<void> setUserId(String method) async {
    final myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setString(userId ?? '', method);

  }

  Future<String> getUserId() async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(userId) ?? '';
  }

  Future<void> setUserLogin(bool isLogin)async{
    final myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setBool(userLogin, isLogin);
  }

  Future<bool> isUserLogin()async{
    final myPrefs = await SharedPreferences.getInstance();
    return  myPrefs.getBool(userLogin)??false;
  }
  Future<void> setSessionData({required String userId, required String token, required String role}) async {
    final myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(userId ?? '', userId);
    myPrefs.setString(userHash, token);
    myPrefs.setString(role, role);
    if(token.isNotEmpty) {
      myPrefs.setBool(userLogin, true);
    }
  }

  Future<void> setStringValue(String key, String? value) async {
    final myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setString(key, value.toString());
  }

  Future<String> getStringValue(String key) async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key) ?? '';
  }

  Future<void> setStringArrayValue(String key, List<String> value) async {
    final myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setStringList(key, value);
  }

  Future<List<String>> getStringArrayValue(String key) async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getStringList(key) ?? <String>[];
  }

  Future<void> setIntegerValue(String key, int value) async {
    await (await SharedPreferences.getInstance()).setInt(key, value);
  }

  Future<int> getIntegerValue(String key) async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getInt(key) ?? 0;
  }

  //ignore: avoid_positional_boolean_parameters
  Future<void> setBooleanValue(String key, bool value) async {
    final myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }

  Future<bool> containsKey(String key) async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.containsKey(key);
  }

  Future<bool> removeValue(String key) async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.remove(key);
  }

  Future<bool> removeAllLoginData() async {
    return (await MySharedPrefrence().removeValue(session) &&
        await MySharedPrefrence().removeValue(location));
  }

  Future<bool> removeAll() async {
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.clear();
  }
}
