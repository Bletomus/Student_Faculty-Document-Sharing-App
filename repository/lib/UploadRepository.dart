import 'package:models/Uploads.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

class UploadRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 1;
  UploadRepository()
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchUploads(String location) async
  {
    final response =  await provider.getUploads(apiConstants.getUploadsEndPoint(),location);
    var parsed = response.cast<Map<String,dynamic>>();
    //return List<StudentScores>.from(response.map((data) => StudentScores.fromJson(data)));
    return parsed.map<Uploads>((json) => Uploads.fromJson(json)).toList();
  }
}