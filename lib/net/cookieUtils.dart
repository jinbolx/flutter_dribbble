import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_dribbble/config/urls.dart';
import 'package:path_provider/path_provider.dart';


class CookiesUtils {
  static Directory directory;

  static CookieJar getCookieJar() {
    String cookiePath = directory.path + "/.cookies/";
    print("cookiePath=" + cookiePath);
    var cookieJar = PersistCookieJar(dir: cookiePath);
    List<Cookie> cookies = cookieJar.loadForRequest(Uri.parse(app_url));
    print("cookies: " + cookies.toString());
    return cookieJar;
  }

  static Future<Directory> initDocDir() async {
    directory = await getApplicationDocumentsDirectory();
  }

  static List<Cookie> getCookies(String url) {
    var cookieJar = getCookieJar();
    return cookieJar.loadForRequest(Uri.parse(url));
  }

  static Map<String, String> getHeaders(String url) {
    var cookie = getCookies(url);
    String cookieString = cookie.toString();
    return {'Cookie': cookieString.substring(1, cookieString.length - 1)};
  }

  static String getEntUser() {
    List<Cookie> list = getCookies(app_url);
    for (int i = 0; i < list.length; i++) {
      if ("ENTUSER" == list[i].name) {
        return list[i].value.toString();
      }
    }
    return "";
  }

  static String getPHPSESSID() {
    List<Cookie> list = getCookies(app_url);
    for (int i = 0; i < list.length; i++) {
      if ("PHPSESSID" == list[i].name) {
        return list[i].value.toString();
      }
    }
    return "";
  }
}
