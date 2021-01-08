import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:networking/ApiConstants.dart';

import 'package:networking/networking.dart';

void main()
{
  test('testing for connection', ()
  async {
    //First test to validate a user
    ApiConstants apiConstants = ApiConstants(1);
    var url = apiConstants.getValidateUserEndpoint() + '1712510101';
    ApiFactory apiFactory = ApiFactory(1);
    dynamic api = apiFactory.getProvider();
    debugPrint(url);
    expect(await api.isUserAvailable(url), true,);

    /*
    // Second test to get user info
    ApiConstants apiConstants2 = ApiConstants(1);
    var url2 = apiConstants2.getUserInformationEndpoint() + '1712510101';
    ApiFactory apiFactory2 = ApiFactory(1);
    dynamic api2 = apiFactory2.getProvider();
    debugPrint(url2);
    var re = await api2.getUserInformation(url2);


    //expect(re == null, false,);

    // Third test to get Student Scores
    ApiConstants apiConstants3 = ApiConstants(1);
    var url3 = apiConstants3.getStudentScoresEndpoint() + '1712510101';
    ApiFactory apiFactory3 = ApiFactory(1);
    dynamic api3 = apiFactory3.getProvider();
    debugPrint(url3);
    var re1 = await api3.getUserInformation(url3);


    expect(re1 == null, false,);
    */
    //Fourth Test to get Courses
    ApiConstants apiConstants3 = ApiConstants(1);
    var url3 = apiConstants3.getStudentCoursesEndpoint() + '1712510101';
    ApiFactory apiFactory3 = ApiFactory(1);
    dynamic api3 = apiFactory3.getProvider();
    debugPrint(url3);
    var re1 = await api3.getUserInformation(url3);
    expect(re1 == null, false,);
  });
}
