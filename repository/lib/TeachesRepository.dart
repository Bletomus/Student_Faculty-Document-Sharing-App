import 'package:models/Teaches.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

class TeachesRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 2;
  TeachesRepository()
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchTeaches(String UserId) async
  {
    final response =  await provider.getUserInformation(apiConstants.getTeachesEndpoint() + UserId);
    var parsed = response.cast<Map<String,dynamic>>();
    //return List<StudentScores>.from(response.map((data) => StudentScores.fromJson(data)));
    return parsed.map<Teaches>((json) => Teaches.fromJson(json)).toList();
  }
}