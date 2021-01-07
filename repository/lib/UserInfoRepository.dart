
import 'package:models/StudentInfo.dart';
import 'package:models/TeacherInfo.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

class UserInfoRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 1;
  UserInfoRepository(int choice)
  {
    this.choice = choice;
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchUserInfo(String UserId) async
  {
    final response =  await provider.getUserInformation(apiConstants.getUserInformationEndpoint() + UserId);
    if(choice == 1)
    {
      return StudentInfo.fromJson(response);
    }
    else
    {
      return FacultyInfo.fromJson(response);
    }
  }
}