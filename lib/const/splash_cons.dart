
import 'package:flutter/material.dart';

class AppLink {
  static List<String> links = [
    'https://google.com',
    'https://share.shabakaty.com/PostDetails/739074002',
    'https://www.devicespecifications.com/en/model/f45a5dc3',
  ];
}

class AppDark {
  static bool isDark(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}