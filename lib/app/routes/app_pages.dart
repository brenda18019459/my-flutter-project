import 'package:get/get.dart';
import 'package:quiz/app/modules/home/controllers/user_is_signin.dart';
import 'package:quiz/app/modules/home/views/Login_screen.dart';
import 'package:quiz/app/modules/home/views/add_subject_screen.dart';
import 'package:quiz/app/modules/home/views/forgot_password_screen.dart';
import 'package:quiz/app/modules/home/views/signup_screen.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/add_test_attempt_screen.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => IsSignIn(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT,
      page: () => ForgotPasswordScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADDSUBJECT,
      page: () =>   AddSubjectScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADDTEST,
      page: () =>   AddTestAttempt(),
      binding: HomeBinding(),
    ),
  ];
}
