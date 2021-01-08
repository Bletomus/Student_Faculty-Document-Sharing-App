import 'package:models/Courses.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

class CourseRepository
{
  dynamic provider=null;
  ApiConstants apiConstants = null;
  int choice = 1;
  CourseRepository()
  {
    provider = ApiFactory(choice).getProvider();
    apiConstants = ApiConstants(choice);
  }

  Future<dynamic> fetchCourses(String UserId) async
  {
    final response =  await provider.getUserInformation(apiConstants.getStudentCoursesEndpoint() + UserId);
    var parsed = response.cast<Map<String,dynamic>>();
    return parsed.map<Courses>((json) => Courses.fromJson(json)).toList();
  }
}