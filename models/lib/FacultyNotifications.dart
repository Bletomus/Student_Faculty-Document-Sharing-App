class FacultyNotifications {
  String id;
  String notificationName;
  String notification;
  String type;
  String noteTime;
  bool hasUpload;
  String sCls;
  Upload upload;
  RegisteredDepartment registeredDepartment;
  ResponibleFaculty responibleFaculty;

  FacultyNotifications(
      {this.id,
        this.notificationName,
        this.notification,
        this.type,
        this.noteTime,
        this.hasUpload,
        this.sCls,
        this.upload,
        this.registeredDepartment,
        this.responibleFaculty});

  FacultyNotifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationName = json['notification_name'];
    notification = json['notification'];
    type = json['type_'];
    noteTime = json['note_time'];
    hasUpload = json['has_upload'];
    sCls = json['_cls'];
    upload = json['upload'] != null ? new Upload.fromJson(json['upload']) : null;
    registeredDepartment = json['registered_department'] != null
        ? new RegisteredDepartment.fromJson(json['registered_department'])
        : null;
    responibleFaculty = json['responible_faculty'] != null
        ? new ResponibleFaculty.fromJson(json['responible_faculty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_name'] = this.notificationName;
    data['notification'] = this.notification;
    data['type_'] = this.type;
    data['note_time'] = this.noteTime;
    data['has_upload'] = this.hasUpload;
    data['_cls'] = this.sCls;
    if (this.upload != null) {
      data['upload'] = this.upload.toJson();
    }
    if (this.registeredDepartment != null) {
      data['registered_department'] = this.registeredDepartment.toJson();
    }
    if (this.responibleFaculty != null) {
      data['responible_faculty'] = this.responibleFaculty.toJson();
    }
    return data;
  }
}

class RegisteredDepartment {
  String id;
  String departmentName;

  RegisteredDepartment({this.id, this.departmentName});

  RegisteredDepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentName = json['department_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['department_name'] = this.departmentName;
    return data;
  }
}

class ResponibleFaculty {
  String id;
  String personName;
  int personNumber;
  String gender;
  String nationality;
  List<int> phoneNumber;
  FacultyMajor facultyMajor;

  ResponibleFaculty(
      {this.id,
        this.personName,
        this.personNumber,
        this.gender,
        this.nationality,
        this.phoneNumber,
        this.facultyMajor});

  ResponibleFaculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personName = json['person_name'];
    personNumber = json['person_number'];
    gender = json['gender'];
    nationality = json['nationality'];
    phoneNumber = json['phone_number'].cast<int>();
    facultyMajor = json['faculty_major'] != null
        ? new FacultyMajor.fromJson(json['faculty_major'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['person_name'] = this.personName;
    data['person_number'] = this.personNumber;
    data['gender'] = this.gender;
    data['nationality'] = this.nationality;
    data['phone_number'] = this.phoneNumber;
    if (this.facultyMajor != null) {
      data['faculty_major'] = this.facultyMajor.toJson();
    }
    return data;
  }
}

class FacultyMajor {
  String id;
  String major;
  String majorDepartment;

  FacultyMajor({this.id, this.major, this.majorDepartment});

  FacultyMajor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    major = json['major'];
    majorDepartment = json['major_department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['major'] = this.major;
    data['major_department'] = this.majorDepartment;
    return data;
  }
}
class Upload {
  String id;
  String fileName;
  String location;
  String uploader;
  String uploadTime;
  String file;

  Upload(
      {this.id,
        this.fileName,
        this.location,
        this.uploader,
        this.uploadTime,
        this.file});

  Upload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['file_name'];
    location = json['location'];
    uploader = json['uploader'];
    uploadTime = json['upload_time'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file_name'] = this.fileName;
    data['location'] = this.location;
    data['uploader'] = this.uploader;
    data['upload_time'] = this.uploadTime;
    data['file'] = this.file;
    return data;
  }
}