import 'dart:developer';

import 'package:flutter_vibrate/flutter_vibrate.dart';

class Vibro {
  start(bool _canVibrate, {required FeedbackType feedbackType}) {
    if (_canVibrate) {
      try {
        Vibrate.feedback(feedbackType);
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }
}
