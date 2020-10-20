import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_locale/localization/app_localization.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_locale/localization/langEn/langEn_model.dart';

List<LangEn> readFile(File file) {
  try {
    String localedata = file.readAsStringSync();
    return langEnFromJson(localedata);
  } catch (e) {
    print(e.toString());
    return List<LangEn>();
  }
}

String lang = 'en';
void setLanguage(String code) {
  lang = code;
  print('Language $lang');
}

void writeFile(Map<String, dynamic> arg) =>
    arg['file']?.writeAsStringSync(arg['data'], flush: true);

class LangServices {
  String versionApi;
  var dir = Directory('cache');

  static const String url =
      'https://raw.githubusercontent.com/kesharaJayasinghe/json_test/master/langEn.json';
  static const String urlUpdate =
      'https://raw.githubusercontent.com/kesharaJayasinghe/json_test/master/appInfo.json';

  Future<List<LangEn>> getData() async {
    bool update = await compareLastVersion;
    if (update) {
      final file = await _createFile();
      if (await file.exists())
        return await compute(readFile, file);
      else
        return null;
    }
    try {
      final response = await http.get(url);
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      if (200 == response.statusCode) {
        final String utfData = utf8.decode(response.bodyBytes);
        final List<LangEn> data = await compute(langEnFromJson, utfData);
        final file = await _createFile();
        Map<String, dynamic> args = {'file': file, 'data': utfData};
        await compute(writeFile, args);
        await preferences.setString('updateVersion', versionApi.toString());
        return data;
      } else {
        return List<LangEn>();
      }
    } catch (e) {
      return List<LangEn>();
    }
  }

  Future<File> _createFile() async {
    Directory tempDir = await getTemporaryDirectory();
    print(tempDir.path);
    return File('${tempDir.path}/Data.json');
  }

  Future<bool> get compareLastVersion async {
    final versionCache = await _lastVersionDB;
    versionApi = await _lastVersionApi;

    if (versionCache == null) return false;
    return versionApi?.compareTo(versionCache) == 0 ?? false;
  }

  Future<String> get _lastVersionApi async {
    try {
      final response = await http.get(urlUpdate);
      String version;
      String langVersion;
      if (200 == response.statusCode) {
        final data = jsonDecode(response.body);
        // print(data['version'].toString());
        version = (data['version'] ?? '').toString();
        langVersion = version.split('.').last;
        // print(langVersion);
      }
      return langVersion;
    } catch (e) {
      return null;
    }
  }

  Future<String> get _lastVersionDB async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return (preferences.getString('updateVersion') ?? '');
  }
}
