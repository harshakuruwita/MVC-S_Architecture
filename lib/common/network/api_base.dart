import 'package:flutter/foundation.dart';

// ignore: avoid_classes_with_only_static_members
class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return 'https://ccoding.owwn.com/hermes/';
    } else {
      return 'https://ccoding.owwn.com/hermes/';
    }
  }
}
