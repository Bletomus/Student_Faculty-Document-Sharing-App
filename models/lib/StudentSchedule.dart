class StudentSchedule
{
  String id;
  int scheduledYear;
  String scheduledTime;
  ScheduledBuilding scheduledBuilding;
  ScheduledSemester scheduledSemester;
  ScheduledMajor scheduledMajor;
  ScheduledCourse scheduledCourse;

  StudentSchedule(
      {this.id,
        this.scheduledYear,
        this.scheduledTime,
        this.scheduledBuilding,
        this.scheduledSemester,
        this.scheduledMajor,
        this.scheduledCourse});

  StudentSchedule.fromJson(Map<String, dynamic> json) {
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
        ? new ScheduledMajor.fromJson(json['scheduled_major'])
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

class ScheduledMajor {
  String id;
  String major;
  MajorDepartment majorDepartment;

  ScheduledMajor({this.id, this.major, this.majorDepartment});

  ScheduledMajor.fromJson(Map<String, dynamic> json) {
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
