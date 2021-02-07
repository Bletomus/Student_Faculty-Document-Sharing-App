class StudentTakes {
  String id;
  int yearSemester;
  StudentTaking studentTaking;
  CourseTaken courseTaken;
  SemesterTaken semesterTaken;

  StudentTakes(
      {this.id,
        this.yearSemester,
        this.studentTaking,
        this.courseTaken,
        this.semesterTaken});

  StudentTakes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    yearSemester = json['year_semester'];
    studentTaking = json['student_taking'] != null
        ? new StudentTaking.fromJson(json['student_taking'])
        : null;
    courseTaken = json['course_taken'] != null
        ? new CourseTaken.fromJson(json['course_taken'])
        : null;
    semesterTaken = json['semester_taken'] != null
        ? new SemesterTaken.fromJson(json['semester_taken'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year_semester'] = this.yearSemester;
    if (this.studentTaking != null) {
      data['student_taking'] = this.studentTaking.toJson();
    }
    if (this.courseTaken != null) {
      data['course_taken'] = this.courseTaken.toJson();
    }
    if (this.semesterTaken != null) {
      data['semester_taken'] = this.semesterTaken.toJson();
    }
    return data;
  }
}

class StudentTaking {
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

  StudentTaking(
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

  StudentTaking.fromJson(Map<String, dynamic> json) {
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
  MajorDepartment majorDepartment;

  StudentMajor({this.id, this.major, this.majorDepartment});

  StudentMajor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    major = json['major'];
    majorDepartment = json['major_department'] != null
        ? new MajorDepartment.fromJson(json['major_department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['major'] = this.major;
    if (this.majorDepartment != null) {
      data['major_department'] = this.majorDepartment.toJson();
    }
    return data;
  }
}

class MajorDepartment {
  String id;
  String departmentName;

  MajorDepartment({this.id, this.departmentName});

  MajorDepartment.fromJson(Map<String, dynamic> json) {
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

class CourseTaken {
  String id;
  String courseName;
  int courseId;

  CourseTaken({this.id, this.courseName, this.courseId});

  CourseTaken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    courseId = json['course_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['course_id'] = this.courseId;
    return data;
  }
}

class SemesterTaken {
  String id;
  int semesterNumber;
  String semesterName;

  SemesterTaken({this.id, this.semesterNumber, this.semesterName});

  SemesterTaken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    semesterNumber = json['semester_number'];
    semesterName = json['semester_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['semester_number'] = this.semesterNumber;
    data['semester_name'] = this.semesterName;
    return data;
  }
}
