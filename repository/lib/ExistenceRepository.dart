
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';
import 'dart:async';

class ExistenceRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  ExistenceRepository(int choice)
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<bool> fetchisAvaible(String UserId) async
  {
    final response =  await provider.isUserAvailable(apiConstants.getValidateUserEndpoint() + UserId);
    return response;
  }
}