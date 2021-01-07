class StudentInfo
{
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

  StudentInfo
    (
      {
        this.id,
        this.studentName,
        this.studentNumber,
        this.studentGender,
        this.studentNationality,
        this.studentPhoneNumber,
        this.idType,
        this.enrollmentDate,
        this.originCountry,
        this.placeOfBirth,
        this.studentMajor
      }
    );

  StudentInfo.fromJson(Map<String, dynamic> json)
  {
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

  Map<String, dynamic> toJson()
  {
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
    if (this.studentMajor != null)
    {
      data['student_major'] = this.studentMajor.toJson();
    }
    return data;
  }
}

class StudentMajor
{
  String id;
  String major;
  MajorDepartment majorDepartment;

  StudentMajor({this.id, this.major, this.majorDepartment});

  StudentMajor.fromJson(Map<String, dynamic> json)
  {
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
    if (this.majorDepartment != null) {
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
