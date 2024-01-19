import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static getData(String key){
    return sharedPreferences.get(key);
  }

  static setValue(String key, dynamic value){
    if(value is int){
      sharedPreferences.setInt(key, value);
    }else if(value is String){
      sharedPreferences.setString(key, value);
    }else if(value is double){
      sharedPreferences.setDouble(key, value);
    }else if(value is bool){
      sharedPreferences.setBool(key, value);
    }
  }

  static clearByKey(String key){
    sharedPreferences.remove(key);
  }

  static clearData(){
    sharedPreferences.clear();
  }
}