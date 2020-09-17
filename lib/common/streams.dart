import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class StreamSubController {
  final _subList = List<StreamSubscription>();

  void _bindSub(StreamSubscription subscription) {
    _subList.add(subscription);
  }

  @protected
  void subDispose() {
    _subList
      ..forEach((element) => element.cancel())
      ..clear();
  }
}

extension StreamSubscriptionEx on StreamSubscription {
  void bindLife(StreamSubController controller) {
    controller._bindSub(this);
  }
}

extension StreamControllerEx<T> on StreamController<T> {
  void safeAdd(T t) {
    if (this.isClosed) {
      return;
    }
    this.add(t);
  }
}
