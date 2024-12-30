import 'package:flutter/widgets.dart';
import 'dart:developer';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class LogUtility {
  static writeLog(dynamic value) {
    log("App-Log : $value");
  }
}
