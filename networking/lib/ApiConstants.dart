

class ApiConstants
{
  static final baseUrl = "https://276def0f396d.ngrok.io/";
  final baseTeacherApi = "api/v1/teachers/";
  final baseStudentApi = "api/v1/students/";
  final String validateStudentEndpoint = "validate_student/";
  final String validateTeacherEndpoint = "validate_teacher/";
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
}