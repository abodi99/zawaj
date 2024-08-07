import 'package:get/get.dart';
import '../features/authentication/controllers/complete_registration_controller.dart';
import '../features/authentication/controllers/login_controller.dart';
import '../features/authentication/controllers/on_boarding_controller.dart';
import '../features/authentication/controllers/otp_controller.dart';
import '../features/authentication/controllers/signup_controller.dart';
import '../repository/authentication_repository/authentication_repository.dart';
import '../repository/user_repository/user_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);

    Get.lazyPut(() => OnBoardingController(), fenix: true);
    Get.lazyPut(() => CompleteRegistrationController(), fenix: true);

    Get.lazyPut(() => LoginController(), fenix: true);
  //  Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => OTPController(), fenix: true);
  }
}
