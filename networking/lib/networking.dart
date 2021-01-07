library networking;

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'CustomException.dart';

class ApiFactory
{
  int choice =1;

  ApiFactory(this.choice);

  dynamic getProvider()
  {
    if (choice == 1)
      return StudentApiProvider();
    else
      return FacultyApiProvider();

  }
}

class BaseApiProvider
{
  dynamic apiResponse(http.Response response)
  {
    switch(response.statusCode)
    {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode that is : ${response.statusCode}');
    }
  }

  Future<dynamic> getUserInformation(String url) async
  {
    var jsonResponse;
    try
    {
      final response = await http.get(url);
      jsonResponse  = apiResponse(response);
    }
    on SocketException
    {
      throw FetchDataException("No internet connection");
    }
    return jsonResponse;
  }
  dynamic isAvailableGetResponse(http.Response response)
  {
    switch(response.statusCode)
    {
      case 200:
        return true;
      case 404:
        return false;
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> isUserAvailable(String url) async
  {
    var isAvailable = false;
    try
    {
      final response = await http.get(url);
      isAvailable = isAvailableGetResponse(response);
    }
    on SocketException
    {
      throw FetchDataException("No internet connection");
    }
    return isAvailable;
  }


}

class StudentApiProvider extends BaseApiProvider
{
}

class FacultyApiProvider extends BaseApiProvider
{
}

