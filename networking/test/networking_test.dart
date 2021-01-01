import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:networking/ApiConstants.dart';

import 'package:networking/networking.dart';

void main()
{
  test('testing for connection', ()
  async {
    ApiConstants apiConstants = ApiConstants(1);
    var url = apiConstants.getValidateUserEndpoint() + '1712510101';
    ApiFactory apiFactory = ApiFactory(1);
    dynamic api = apiFactory.getProvider();
    debugPrint(url);
    expect(await api.isUserAvailable(url), true,);
  });
}
