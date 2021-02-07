
import 'package:models/StudentTakes.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';
class StudentTakesRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 1;
  StudentTakesRepository()
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchStudentTakes(String UserId) async
  {
    final response =  await provider.getUserInformation(apiConstants.getStudentTakesEndpoint() + UserId);
    var parsed = response.cast<Map<String,dynamic>>();
    //return List<StudentScores>.from(response.map((data) => StudentScores.fromJson(data)));
    return parsed.map<StudentTakes>((json) => StudentTakes.fromJson(json)).toList();
  }
}