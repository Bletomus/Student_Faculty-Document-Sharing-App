class StudentNotifications {
  String id;
  String notificationName;
  String notification;
  String type;
  String noteTime;
  bool hasUpload;
  List<Targets> targets;
  String sCls;
  Upload upload;
  RegisteredDepartment registeredDepartment;
  ResponibleFaculty responibleFaculty;

  StudentNotifications(
      {this.id,
        this.notificationName,
        this.notification,
        this.type,
        this.noteTime,
        this.hasUpload,
        this.targets,
        this.sCls,
        this.upload,
        this.registeredDepartment,
        this.responibleFaculty});

  StudentNotifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationName = json['notification_name'];
    notification = json['notification'];
    type = json['type_'];
    noteTime = json['note_time'];
    hasUpload = json['has_upload'];
    if (json['targets'] != null) {
      targets = new List<Targets>();
      json['targets'].forEach((v) {
        targets.add(new Targets.fromJson(v));
      });
    }
    sCls = json['_cls'];
    upload =
    json['upload'] != null ? new Upload.fromJson(json['upload']) : null;
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
    if (this.targets != null) {
      data['targets'] = this.targets.map((v) => v.toJson()).toList();
    }
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

class Targets {
  String id;
  String studentName;
  int studentNumber;
  String studentGender;
  String studentNationality;
  List<int> studentPhoneNumber;
  String idType;
  String enrollmentDate;
  String originCountry;
  String placeOfBirth;
  StudentMajor studentMajor;

  Targets(
      {this.id,
        this.studentName,
        this.studentNumber,
        this.studentGender,
        this.studentNationality,
        this.studentPhoneNumber,
        this.idType,
        this.enrollmentDate,
        this.originCountry,
        this.placeOfBirth,
        this.studentMajor});

  Targets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student_name'];
    studentNumber = json['student_number'];
    studentGender = json['student_gender'];
    studentNationality = json['student_nationality'];
    studentPhoneNumber = json['student_phone_number'].cast<int>();
    idType = json['id_type'];
    enrollmentDate = json['enrollment_date'];
    originCountry = json['origin_country'];
    placeOfBirth = json['place_of_birth'];
    studentMajor = json['student_major'] != null
        ? new StudentMajor.fromJson(json['student_major'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_name'] = this.studentName;
    data['student_number'] = this.studentNumber;
    data['student_gender'] = this.studentGender;
    data['student_nationality'] = this.studentNationality;
    data['student_phone_number'] = this.studentPhoneNumber;
    data['id_type'] = this.idType;
    data['enrollment_date'] = this.enrollmentDate;
    data['origin_country'] = this.originCountry;
    data['place_of_birth'] = this.placeOfBirth;
    if (this.studentMajor != null) {
      data['student_major'] = this.studentMajor.toJson();
    }
    return data;
  }
}

class StudentMajor {
  String id;
  String major;
  String majorDepartment;

  StudentMajor({this.id, this.major, this.majorDepartment});

  StudentMajor.fromJson(Map<String, dynamic> json) {
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
  StudentMajor facultyMajor;

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
        ? new StudentMajor.fromJson(json['faculty_major'])
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

