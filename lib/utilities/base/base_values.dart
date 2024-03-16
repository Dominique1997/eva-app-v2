import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class BaseValues {
  void setServerUrl(String serverUrl) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_url", serverUrl);
  }

  void setServerPort(String serverPort) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_port", serverPort);
  }

  void setDefaultLanguage(String selectedLanguage) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("DefaultLanguage", selectedLanguage);
  }

  Future<String> getServerUrl() async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString("server_url") ?? "localhost";
    } catch (error) {
      print('Error retrieving shared preferences: $error');
      return "localhost";
    }
  }

  Future<String> getServerPort() async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString("server_port") ?? "9999";
    } catch (error) {
      print('Error retrieving shared preferences: $error');
      return "9999";
    }
  }

  Future<String> getDefaultLanguage() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("DefaultLanguage") ?? "English";
  }

  void resetPreferences() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove("server_url");
    sharedPref.remove("server_port");
  }
}
