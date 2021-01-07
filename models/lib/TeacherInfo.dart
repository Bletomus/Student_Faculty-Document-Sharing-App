class FacultyInfo
{
  String personName;
  int personNumber;
  String gender;
  String nationality;
  List<int> phoneNumber;
  FacultyMajor facultyMajor;

  FacultyInfo(
      {this.personName,
        this.personNumber,
        this.gender,
        this.nationality,
        this.phoneNumber,
        this.facultyMajor});

  FacultyInfo.fromJson(Map<String, dynamic> json) {
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

class FacultyMajor
{
  String id;
  String major;
  MajorDepartment majorDepartment;

  FacultyMajor({this.id, this.major, this.majorDepartment});

  FacultyMajor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    major = json['major'];
    majorDepartment = json['major_department'] != null
        ? new MajorDepartment.fromJson(json['major_department'])
        : null;
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['major'] = this.major;
    if (this.majorDepartment != null)
    {
      data['major_department'] = this.majorDepartment.toJson();
    }
    return data;
  }
}

class MajorDepartment
{
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
