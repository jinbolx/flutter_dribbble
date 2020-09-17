import 'package:flutter/material.dart';
import 'package:flutter_dribbble/util/system_util.dart';

void debugLog(dynamic msg) {
  if (!isDebug) return;

  debugPrint("$msg");
}
