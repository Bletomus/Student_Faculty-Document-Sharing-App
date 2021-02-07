

import 'package:models/StudentSchedule.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

class StudentScheduleRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 1;
  StudentScheduleRepository()
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchStudentSchedule(String UserId) async
  {
    final response =  await provider.getUserInformation(apiConstants.getStudentScheduleEndpoint() + UserId);
    var parsed = response.cast<Map<String,dynamic>>();
    //return List<StudentScores>.from(response.map((data) => StudentScores.fromJson(data)));
    return parsed.map<StudentSchedule>((json) => StudentSchedule.fromJson(json)).toList();
  }
}