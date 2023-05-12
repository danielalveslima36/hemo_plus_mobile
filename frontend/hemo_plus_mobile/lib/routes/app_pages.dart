import 'package:get/get.dart';
import 'package:hemo_plus_mobile/Doador/view/cadastro.dart';
import 'package:hemo_plus_mobile/login/view/login.dart';
import 'package:hemo_plus_mobile/routes/app_router.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => Cadastro(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => Login(),

    ),
  ];
}