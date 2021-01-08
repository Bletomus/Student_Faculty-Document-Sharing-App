import 'dart:async';

import 'package:models/Courses.dart';
import 'package:networking/Response.dart';
import 'package:repository/CourseRepository.dart';

class CoursesBlocs
{
  CourseRepository courseRepository = null;
  StreamController courseController = null;

  StreamSink<Response<dynamic>> get courseSink => courseController.sink;

  Stream<Response<dynamic>> get courseStream => courseController.stream;

  String userId;
  CoursesBlocs(String userId)
  {
    courseController = StreamController<Response<dynamic>>();
    courseRepository = CourseRepository();
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    courseSink.add(Response.loading('Looking for Information!'));
    try
    {
      List<Courses> courses= await courseRepository.fetchCourses(userId);
      courseSink.add(Response.completed(courses));
    }
    catch (e)
    {
      courseSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    courseController?.close();
  }
}