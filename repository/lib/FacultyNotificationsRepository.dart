import 'package:models/FacultyNotifications.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

class FacultyNotificationsRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 2;
  FacultyNotificationsRepository()
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchFacultyNotifications(String UserId) async
  {
    final response =  await provider.getUserInformation(apiConstants.getNotificationsEndpoint() + UserId);
    var parsed = response.cast<Map<String,dynamic>>();
    //return List<StudentScores>.from(response.map((data) => StudentScores.fromJson(data)));
    return parsed.map<FacultyNotifications>((json) => FacultyNotifications.fromJson(json)).toList();
  }
}