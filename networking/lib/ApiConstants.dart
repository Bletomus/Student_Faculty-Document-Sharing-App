

class ApiConstants
{
  static final baseUrl = "https://2ffe27b3bacf.ngrok.io/";
  final baseTeacherApi = "api/v1/teachers/";
  final baseStudentApi = "api/v1/students/";
  final String baseNotificationsApi = "api/v1/notifications/";
  final String validateStudentEndpoint = "validate_student/";
  final String validateTeacherEndpoint = "validate_teacher/";
  final String getStudentInformationEndpoint ="get_student_details/";
  final String getFacultyInformationEndpoint ="get_faculty_details/";
  final String getStudentScores = "get_Student_Scores/";
  final String getStudentCourses = "get_Courses/";
  final String getStudentSchedule = "get_schedule/";
  final String getStudentNotifications = "get_student_notifications/";
  final String getFacultyNotifications = "get_faculty_notifications/";
  final String getTeaches = "get_Teaches/";
  final String getUploads = "get_Uploads/";
  final String sendUploads = "upload_file/";
  final String downloadFile = "download_file/";
  final String downloadNoteFile = "download_For_Notification_File/";
  final String studentTakes = "get_Student_Takes/";
  final String sendNoteUpload = "upload_file_in_note/";
  int choice = 1;

  ApiConstants(this.choice);
  String getBaseNotificationsUrl()
  {
      return baseUrl + baseNotificationsApi;
  }
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
  String getStudentTakesEndpoint()
  {
    return getBaseUrl() + studentTakes;
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

  String getStudentScheduleEndpoint()
  {
    if(choice == 1)
      return getBaseUrl() + getStudentSchedule;
  }
  String getTeachesEndpoint()
  {
    if(choice == 2)
      return getBaseUrl() + getTeaches;
  }
  String getNotificationsEndpoint()
  {
    if(choice == 1)
      return getBaseNotificationsUrl() + getStudentNotifications;
    else
      return getBaseNotificationsUrl() + getFacultyNotifications;
  }
  String getUploadsEndPoint()
  {
      return getBaseNotificationsUrl() + getUploads;
  }
  String sendUploadsEndPoint()
  {
    return getBaseNotificationsUrl() + sendUploads;
  }
  String sendUploadsWithNoteEndPoint()
  {
    return getBaseNotificationsUrl() + sendNoteUpload;
  }
  String downloadEndPoint()
  {
    return getBaseNotificationsUrl() + downloadFile;
  }
  String downloadNoteEndPoint()
  {
    return getBaseNotificationsUrl() + downloadNoteFile;
  }
}