
import 'package:app/binds/base/host_bind.dart';
import 'package:app/binds/base/sign_bind.dart';
import 'package:app/binds/base/star_bind.dart';
import 'package:app/pages/base/host/host_page.dart';
import 'package:app/pages/base/sign/forget_page.dart';
import 'package:app/pages/base/sign/signin_page.dart';
import 'package:app/pages/base/sign/signup_page.dart';
import 'package:app/pages/base/star/star_page.dart';
import 'package:app/route/base/base_route.dart';
import 'package:get/get.dart';

///
class BasePages {

  BasePages._();

  static final routes = [
    GetPage(
      name: BaseRoute.star,
      page: () => StarPage(),
      binding: StarBind(),
    ),
    GetPage(
      name: BaseRoute.host,
      page: () => HostPage(),
      binding: HostBind(),
    ),
    GetPage(
      name: BaseRoute.signin,
      page: () => SigninPage(),
      binding: SignBind(),
    ),
    GetPage(
      name: BaseRoute.signup,
      page: () => SignupPage(),
      binding: SignBind(),
    ),
    GetPage(
      name: BaseRoute.forget,
      page: () => ForgetPage(),
      binding: SignBind(),
    ),
  ];
}
