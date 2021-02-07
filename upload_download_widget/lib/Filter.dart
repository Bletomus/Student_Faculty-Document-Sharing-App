import 'dart:core';


import 'package:models/Teaches.dart';
class FacultyFilter
{
  static List<String> getUniqueDept(List<Teaches> teaches)
  {
    List<String> filteredList;
    Map<String, String> mpNames = {};
    for (var item in teaches)
    {
      mpNames[item.teacherSchedule.scheduledMajor.majorDepartment.departmentName] = item.teacherSchedule.scheduledMajor.majorDepartment.departmentName;
    }
    filteredList = mpNames.values.toList();
    return filteredList;
  }

  static List<String> getUniqueMajor(List<Teaches> teaches)
  {
    List<String> filteredList;
    Map<String, String> mpNames = {};
    for (var item in teaches)
    {
      mpNames[item.teacherSchedule.scheduledMajor.major] = item.teacherSchedule.scheduledMajor.major;
  }
    filteredList = mpNames.values.toList();
    return filteredList;
  }

  static List<Teaches> getFilteredMajor(List<Teaches> teaches,String dept)
  {
    List<Teaches> filteredList;
    Map<String, Teaches> mpNames = {};
    for (var item in teaches)
    {
      if(item.teacherSchedule.scheduledMajor.majorDepartment.departmentName.contains(dept))
        mpNames[item.teacherSchedule.scheduledMajor.major] = item;
    }
    filteredList= mpNames.values.toList();
    return filteredList;
  }

  static List<Teaches> getCourses(List<Teaches> teaches,String major)
  {
    List<Teaches> filteredList;
    Map<String, Teaches> mpNames = {};
    for (var item in teaches)
    {
      if(item.teacherSchedule.scheduledMajor.major.contains(major))
        mpNames[item.teacherSchedule.scheduledCourse.courseName] = item;
    }
    filteredList= mpNames.values.toList();
    return filteredList;
  }
  static List<Teaches> getSemester(List<Teaches> teaches,String courses)
  {
    List<Teaches> filteredList;
    Map<String, Teaches> mpNames = {};
    for (var item in teaches)
    {
      if(item.teacherSchedule.scheduledCourse.courseName.contains(courses))
        mpNames[item.teacherSchedule.scheduledSemester.semesterName] = item;
    }
    filteredList= mpNames.values.toList();
    return filteredList;
  }

  static List<Teaches> getOneSemester(List<Teaches> teaches,String semester)
  {
    List<Teaches> filteredList;
    Map<String, Teaches> mpNames = {};
    for (var item in teaches)
    {
      if(item.teacherSchedule.scheduledSemester.semesterName.contains(semester))
        mpNames[item.teacherSchedule.scheduledSemester.semesterName] = item;
    }
    filteredList= mpNames.values.toList();
    return filteredList;
  }
}
