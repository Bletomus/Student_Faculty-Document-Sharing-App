import 'package:models/StudentTakes.dart';

class StudentFilter
{
  static List<String> getCourses(List<StudentTakes> student)
  {
    List<String> filteredList;
    Map<String, String> mpNames = {};
    for (var item in student)
    {
      mpNames[item.courseTaken.courseName] = item.courseTaken.courseName;
    }
    filteredList = mpNames.values.toList();
    return filteredList;
  }

  static List<String> getSemester(List<StudentTakes> student,course)
  {
    List<String> filteredList;
    Map<String, String> mpNames = {};
    for (var item in student)
    {
      if(item.courseTaken.courseName.contains(course))
       mpNames[item.semesterTaken.semesterName] = item.semesterTaken.semesterName;
    }
    filteredList = mpNames.values.toList();
    return filteredList;
  }
}