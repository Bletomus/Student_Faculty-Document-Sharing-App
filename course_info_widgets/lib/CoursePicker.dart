import 'package:models/Courses.dart';

class CoursePicker
{
  int type;
  dynamic course;

  CoursePicker(this.type, this.course);

  List<String> getFields()
  {
    if(type == 1)
    {
      return
      [
        "Course: ",
        "Year: ",
        "Semester: ",
        "Grade: ",
        "Attemps: ",
        "Score: ",
        "Credits: ",
      ];
    }
    else
      return
      [
        "Year: ",
        "Semester: ",
        "Course: ",
        "Elective: ",
        "Module: ",
      ];
  }

  List<String> getValues()
  {
    if(type == 1)
    {
      return
      [
        course.studentTook.courseTaken.courseName,
        course.studentTook.yearSemester.toString(),
        course.studentTook.semesterTaken.semesterName,
        course.grade,
        course.attempts.toString(),
        course.score.toString(),
        course.credits.toString(),
      ];
    }
    else
    {
      return
        [
          course.yearCourse.toString(),
          course.semesterCourse.semesterName,
          course.courseCpm.courseName,
          course.elective ? "True":"False",
          course.module.toString(),
        ];
    }

  }
}