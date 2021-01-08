
import 'package:models/StudentScores.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

class StudentScoresRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 1;
  StudentScoresRepository()
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchUserScores(String UserId) async
  {
    final response =  await provider.getUserInformation(apiConstants.getStudentScoresEndpoint() + UserId);
    var parsed = response.cast<Map<String,dynamic>>();
    //return List<StudentScores>.from(response.map((data) => StudentScores.fromJson(data)));
    return parsed.map<StudentScores>((json) => StudentScores.fromJson(json)).toList();
  }
}