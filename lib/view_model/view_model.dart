import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dribbble/common/streams.dart';
import 'package:flutter_dribbble/util/log_util.dart';

class ViewModel extends StreamSubController {
  final isLoading = StreamController<bool>();
  final error = StreamController<bool>();

  bool selfLoading = false;

  LoadType selfLoadType = LoadType.NEW_LOAD;

  void dispose() {
    isLoading.close();
    error.close();
    subDispose();
  }

  void doError(DioError e) {
    if (CancelToken.isCancel(e)) return;
    debugLog(e.message);
    debugLog(e.response.toString());
    error.safeAdd(true);
  }
  void reload(){}
  void loadMore(){}
}

enum LoadType { NEW_LOAD, REFRESH, LOAD_MORE, NO_MORE }
