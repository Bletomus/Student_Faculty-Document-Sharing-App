import 'package:models/StudentNotifications.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

class StudentNotificationsRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 1;
  StudentNotificationsRepository()
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchStudentNotifications(String UserId) async
  {
    final response =  await provider.getUserInformation(apiConstants.getNotificationsEndpoint() + UserId);
    var parsed = response.cast<Map<String,dynamic>>();
    //return List<StudentScores>.from(response.map((data) => StudentScores.fromJson(data)));
    return parsed.map<StudentNotifications>((json) => StudentNotifications.fromJson(json)).toList();
  }
}