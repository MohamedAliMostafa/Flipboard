import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPro extends ChangeNotifier
{
  String language="ar";
  Future<void> changeLang(String lang)
  async {
    language=lang;
    notifyListeners();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_eng", language == "en");
  }
  getThemeandlangAtInit() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? langu = sharedPreferences.getBool("is_eng");
    if (langu != null && langu) {
      language = "ar";
    } else {
      language = "en";
    }
    notifyListeners();
  }
  MyPro()
  {
    getThemeandlangAtInit();
  }
}