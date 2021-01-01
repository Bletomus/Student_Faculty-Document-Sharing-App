import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:view/view.dart';

void main() {
  test('adds one to input values', () async {
    var too = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        too = true;
      }
    } on SocketException catch (_) {
      debugPrint("error");
    }

    expect(too,true);
  });
}
