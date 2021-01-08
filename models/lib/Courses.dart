class Courses {
  String id;
  int yearCourse;
  int module;
  bool elective;
  SemesterCourse semesterCourse;
  MajorCpm majorCpm;
  CourseCpm courseCpm;

  Courses(
      {this.id,
        this.yearCourse,
        this.module,
        this.elective,
        this.semesterCourse,
        this.majorCpm,
        this.courseCpm});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    yearCourse = json['year_course'];
    module = json['module'];
    elective = json['elective'];
    semesterCourse = json['semester_course'] != null
        ? new SemesterCourse.fromJson(json['semester_course'])
        : null;
    majorCpm = json['major_cpm'] != null
        ? new MajorCpm.fromJson(json['major_cpm'])
        : null;
    courseCpm = json['course_cpm'] != null
        ? new CourseCpm.fromJson(json['course_cpm'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year_course'] = this.yearCourse;
    data['module'] = this.module;
    data['elective'] = this.elective;
    if (this.semesterCourse != null) {
      data['semester_course'] = this.semesterCourse.toJson();
    }
    if (this.majorCpm != null) {
      data['major_cpm'] = this.majorCpm.toJson();
    }
    if (this.courseCpm != null) {
      data['course_cpm'] = this.courseCpm.toJson();
    }
    return data;
  }
}

class SemesterCourse {
  String id;
  int semesterNumber;
  String semesterName;

  SemesterCourse({this.id, this.semesterNumber, this.semesterName});

  SemesterCourse.fromJson(Map<String, dynamic> json) {
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

class MajorCpm {
  String id;
  String major;
  MajorDepartment majorDepartment;

  MajorCpm({this.id, this.major, this.majorDepartment});

  MajorCpm.fromJson(Map<String, dynamic> json) {
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

class CourseCpm {
  String id;
  String courseName;
  int courseId;

  CourseCpm({this.id, this.courseName, this.courseId});

  CourseCpm.fromJson(Map<String, dynamic> json) {
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

