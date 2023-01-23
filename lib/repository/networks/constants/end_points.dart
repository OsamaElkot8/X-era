import 'package:xera_task/repository/networks/constants/shared_keys.dart';

class NetworkEndPoints {
  static String? baseUrl;

  static const String pathId = '{${NetworkSharedKeys.id}}';
  static const String login = '/login';
  static const String qRCodeLogin = '/qrcode$login';
  static const String registrations = '/registrations';
  static const String registrationsStudents = '/registrations$students';
  static const String registrationsStudentsAvailableOfferings =
      '$registrationsStudents/available-offerings';
  static const String studentsDashboard = '$students/dashboard';
  static const String students = '/students';
  static const String studentsProfile = '$students/profile';
  static const String userProfile = '/user/profile';
  static const String studentsAcademic = '$students/academic';
  static const String studentAcademicTakenCourses =
      '$studentsAcademic/taken-courses';
  static const String studentsCorrectionRequest =
      '$students/correction-request';
  static const String studentsCorrectionRequestAddBulkPersonalData =
      '$studentsCorrectionRequest/add-bulk-personal-data';
  static const String currentTerm = '/current-term';
  static const String currentTermRegisteredCourses =
      '$currentTerm/registered-courses';
  static const String studentCourses = '$students/courses';
  static const String studentCoursesPathId = '$students/courses/$pathId';
  static const String currentTermRegisteredCoursesPathId =
      '$currentTermRegisteredCourses/$pathId';
  static const String users = '/users';
  static const String excuses = '/excuses';
  static const String payments = '/payments';
  static const String certificates = '/certificates';
  static const String usersLogout = '$users/logout';
}
