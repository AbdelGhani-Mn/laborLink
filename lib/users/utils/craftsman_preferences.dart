// ignore_for_file: unused_field, await_only_futures

import 'dart:convert';

import 'package:laborlink/users/model/craftsman.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CraftsmanPreferences {
  static late SharedPreferences _preferences;

  static const _keyCraftsman = 'craftsman';
  static const myCraftsman = Craftsman(
    imagePath:
        'https://blog.coldwellbanker.com/wp-content/uploads/2012/08/home-repair-tools_300.jpg',
    fullName: 'AbdelGhani Moumen',
    bio: 'certified residential elictrician with years of experience in doing my best in this field, offering competitive prices for a fair job.',
    about: 'Residential Elictrician',
    isDarkMode: false,
  );

  static Future init() async => 
    _preferences = await SharedPreferences.getInstance() ;

  static Future setCraftsman(Craftsman craftsman) async {
    final json = jsonEncode(craftsman.toJson());

    await _preferences.setString(_keyCraftsman, json);
  }

  static Craftsman getCraftsman(){
    final json = _preferences.getString(_keyCraftsman);

    return json == null ? myCraftsman : Craftsman.fromJson(jsonDecode(json));
  }
}
