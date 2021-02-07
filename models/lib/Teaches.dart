class Teaches {
  String id;
  List<ClassOfStudents> classOfStudents;
  Teacher teacher;
  TeacherSchedule teacherSchedule;

  Teaches({this.id, this.classOfStudents, this.teacher, this.teacherSchedule});

  Teaches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['class_of_students'] != null) {
      classOfStudents = [];
      json['class_of_students'].forEach((v) {
        classOfStudents.add(new ClassOfStudents.fromJson(v));
      });
    }
    teacher =
    json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    teacherSchedule = json['teacher_schedule'] != null
        ? new TeacherSchedule.fromJson(json['teacher_schedule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.classOfStudents != null) {
      data['class_of_students'] =
          this.classOfStudents.map((v) => v.toJson()).toList();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    if (this.teacherSchedule != null) {
      data['teacher_schedule'] = this.teacherSchedule.toJson();
    }
    return data;
  }
}

class ClassOfStudents {
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
  bool isChecked =false;
  ClassOfStudents(
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

  ClassOfStudents.fromJson(Map<String, dynamic> json) {
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

class Teacher {
  String id;
  String personName;
  int personNumber;
  String gender;
  String nationality;
  List<int> phoneNumber;
  StudentMajor facultyMajor;

  Teacher(
      {this.id,
        this.personName,
        this.personNumber,
        this.gender,
        this.nationality,
        this.phoneNumber,
        this.facultyMajor});

  Teacher.fromJson(Map<String, dynamic> json) {
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

class TeacherSchedule {
  String id;
  int scheduledYear;
  String scheduledTime;
  ScheduledBuilding scheduledBuilding;
  ScheduledSemester scheduledSemester;
  StudentMajor scheduledMajor;
  ScheduledCourse scheduledCourse;

  TeacherSchedule(
      {this.id,
        this.scheduledYear,
        this.scheduledTime,
        this.scheduledBuilding,
        this.scheduledSemester,
        this.scheduledMajor,
        this.scheduledCourse});

  TeacherSchedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduledYear = json['scheduled_year'];
    scheduledTime = json['scheduled_time'];
    scheduledBuilding = json['scheduled_building'] != null
        ? new ScheduledBuilding.fromJson(json['scheduled_building'])
        : null;
    scheduledSemester = json['scheduled_semester'] != null
        ? new ScheduledSemester.fromJson(json['scheduled_semester'])
        : null;
    scheduledMajor = json['scheduled_major'] != null
        ? new StudentMajor.fromJson(json['scheduled_major'])
        : null;
    scheduledCourse = json['scheduled_course'] != null
        ? new ScheduledCourse.fromJson(json['scheduled_course'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheduled_year'] = this.scheduledYear;
    data['scheduled_time'] = this.scheduledTime;
    if (this.scheduledBuilding != null) {
      data['scheduled_building'] = this.scheduledBuilding.toJson();
    }
    if (this.scheduledSemester != null) {
      data['scheduled_semester'] = this.scheduledSemester.toJson();
    }
    if (this.scheduledMajor != null) {
      data['scheduled_major'] = this.scheduledMajor.toJson();
    }
    if (this.scheduledCourse != null) {
      data['scheduled_course'] = this.scheduledCourse.toJson();
    }
    return data;
  }
}

class ScheduledBuilding {
  String id;
  String building;
  int roomNumber;
  BuildingCampus buildingCampus;

  ScheduledBuilding(
      {this.id, this.building, this.roomNumber, this.buildingCampus});

  ScheduledBuilding.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    building = json['building'];
    roomNumber = json['room_number'];
    buildingCampus = json['building_campus'] != null
        ? new BuildingCampus.fromJson(json['building_campus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['building'] = this.building;
    data['room_number'] = this.roomNumber;
    if (this.buildingCampus != null) {
      data['building_campus'] = this.buildingCampus.toJson();
    }
    return data;
  }
}

class BuildingCampus {
  String id;
  String campus;

  BuildingCampus({this.id, this.campus});

  BuildingCampus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    campus = json['campus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['campus'] = this.campus;
    return data;
  }
}

class ScheduledSemester {
  String id;
  int semesterNumber;
  String semesterName;

  ScheduledSemester({this.id, this.semesterNumber, this.semesterName});

  ScheduledSemester.fromJson(Map<String, dynamic> json) {
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

class ScheduledCourse {
  String id;
  String courseName;
  int courseId;

  ScheduledCourse({this.id, this.courseName, this.courseId});

  ScheduledCourse.fromJson(Map<String, dynamic> json) {
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

