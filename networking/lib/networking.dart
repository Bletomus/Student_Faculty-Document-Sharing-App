library networking;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:flutter/cupertino.dart';
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
      case 204:
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

  dynamic isUploaded(http.StreamedResponse response)
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

  Future<dynamic> getUploads(String url,String location) async
  {
    var jsonResponse;
    try
    {
      final response = await http.post(url,body: {"location":location});
      jsonResponse  = apiResponse(response);
    }
    on SocketException
    {
      throw FetchDataException("No internet connection");
    }
    return jsonResponse;
  }
  Future<dynamic> UploadFile(String path,String url,String name) async
  {
    var isAvailable = false;
    try
    {
      debugPrint(path);
      final req = await http.MultipartRequest('POST', Uri.parse(url),);
      final mimeType = lookupMimeType(path);
      req.files.add((await http.MultipartFile.fromPath('file', path,filename: name,contentType:MediaType.parse(mimeType))));
      final response = await req.send();
      debugPrint(response.reasonPhrase);
      isAvailable = isUploaded(response);
    }
    on SocketException
    {
      throw FetchDataException("No internet connection");
    }
    debugPrint(isAvailable ? "Yes": "No");
    return isAvailable;

  }
  Future<dynamic> UploadFileWithNote(String path,String url,List<int> filteredList,String dept,String name) async
  {
    var isAvailable = false;
    try
    {
      final req = await http.MultipartRequest('POST', Uri.parse(url));

      req.fields['dept'] = dept;
      String targets = "";
      debugPrint(filteredList.length.toString());
      for(var item in filteredList)
      {
        targets += item.toString() + " ";
      }
      debugPrint(targets);
      req.fields['targets'] = targets;
      debugPrint(path);
      final mimeType = lookupMimeType(path);
      debugPrint(path);
      req.files.add((await http.MultipartFile.fromPath('file', path,filename: name,contentType:MediaType.parse(mimeType))));
      final response = await req.send();
      debugPrint(response.reasonPhrase);
      isAvailable = isUploaded(response);
    }
    on SocketException
    {
      throw FetchDataException("No internet connection");
    }
    debugPrint(isAvailable ? "Yes": "No");
    return isAvailable;

  }
}

class StudentApiProvider extends BaseApiProvider
{
}

class FacultyApiProvider extends BaseApiProvider
{
}

