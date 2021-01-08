

class ApiConstants
{
  static final baseUrl = "https://cd65cfce911c.ngrok.io/";
  final baseTeacherApi = "api/v1/teachers/";
  final baseStudentApi = "api/v1/students/";
  final String validateStudentEndpoint = "validate_student/";
  final String validateTeacherEndpoint = "validate_teacher/";
  final String getStudentInformationEndpoint ="get_student_details/";
  final String getFacultyInformationEndpoint ="get_faculty_details/";
  final String getStudentScores = "get_Student_Scores/";
  final String getStudentCourses = "get_Courses/";
  int choice = 1;

  ApiConstants(this.choice);

  String getBaseUrl()
  {
    if(choice == 1)
      return baseUrl + baseStudentApi;
    else
      return baseUrl + baseTeacherApi;
  }
  String getValidateUserEndpoint()
  {
    if(choice == 1)
      return getBaseUrl() + validateStudentEndpoint;
    else
      return getBaseUrl() + validateTeacherEndpoint;
  }

  String getUserInformationEndpoint()
  {
    if(choice == 1)
      return getBaseUrl() + getStudentInformationEndpoint;
    else
      return getBaseUrl() + getFacultyInformationEndpoint;
  }

  String getStudentScoresEndpoint()
  {
    if(choice == 1)
      return getBaseUrl() + getStudentScores;
  }

  String getStudentCoursesEndpoint()
  {
    if(choice == 1)
      return getBaseUrl() + getStudentCourses;
  }
}