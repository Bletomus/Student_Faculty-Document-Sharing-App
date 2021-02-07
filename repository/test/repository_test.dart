import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/StudentTakes.dart';
import 'package:models/Teaches.dart';
import 'package:repository/CourseRepository.dart';
import 'package:repository/ExistenceRepository.dart';
import 'package:repository/FacultyNotificationsRepository.dart';
import 'package:repository/StudentNotificationsRepository.dart';
import 'package:repository/StudentScheduleRepository.dart';
import 'package:repository/StudentScoresRepository.dart';
import 'package:repository/StudentTakesRepository.dart';
import 'package:repository/TeachesRepository.dart';
import 'package:repository/UploadRepository.dart';
import 'package:repository/UserInfoRepository.dart';

import 'package:repository/repository.dart';

void main() {
  test('test repo response', ()
  async {
    //ExistenceRepository existenceRepository = ExistenceRepository(1);
    //expect(await existenceRepository.fetchisAvaible('1712510101'), true);
    //expect(() => calculator.addOne(null), throwsNoSuchMethodError);
    
    //Testing UserInfoRepository
    //UserInfoRepository userInfoRepository = UserInfoRepository(1);
    //var re = await userInfoRepository.fetchUserInfo("1712510101");
    //expect(re == null, false);

    //Testing StudentScoresRepository
    //StudentScoresRepository studentScoresRepository = StudentScoresRepository();
    //var re = await studentScoresRepository.fetchUserScores("1712510101");
    //expect(re == null, false);

    //CourseRepository courseRepository = CourseRepository();
    //var re = await courseRepository.fetchCourses("1712510101");
    //debugPrint(re[0].semesterCourse.semesterName);
    //expect(re == null, false);

    StudentTakesRepository studentTakesRepository = StudentTakesRepository();
    var re = await studentTakesRepository.fetchStudentTakes("1712510101");
    StudentTakes tss = re[0];
    //debugPrint(tss.teacherSchedule.scheduledCourse.courseName);
    expect(re == null, false);

    //UploadRepository uploadRepository = UploadRepository();
    //var re = await uploadRepository.fetchUploads("9725001001");

    //debugPrint(tss.teacherSchedule.scheduledCourse.courseName);
    //expect(re == null, false);

    //StudentNotificationsRepository studentNotificationsRepository = StudentNotificationsRepository();
    //var re = await studentNotificationsRepository.fetchStudentNotifications("1712510101");
    //debugPrint(re[0].semesterCourse.semesterName);
    //expect(re == null, false);

    //FacultyNotificationsRepository facultyNotificationsRepository = FacultyNotificationsRepository();
    //var re = await facultyNotificationsRepository.fetchFacultyNotifications("9725001001");
    //debugPrint(re[0].semesterCourse.semesterName);
    //expect(re == null, false);

    //StudentScheduleRepository studentScheduleRepository = StudentScheduleRepository();
    //var re = await studentScheduleRepository.fetchStudentSchedule("1712510101");
    //debugPrint(re[0].semesterCourse.semesterName);
    //expect(re == null, false);
  });
}
