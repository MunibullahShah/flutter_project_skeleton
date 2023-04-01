// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lms_project/modules/campaigns/view/campaigns_view.dart';
// import 'package:lms_project/modules/login/model/login_model.dart';
// import 'package:lms_project/modules/login/repository/login_repository.dart';
// import 'package:lms_project/utils/helpers/controller.dart';
// import 'package:lms_project/utils/services/local_storage_service.dart';
// import 'package:lms_project/utils/ui/loader.dart';
//
// class LoginController extends Controller {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   RxBool obscurePassword = true.obs;
//   RxBool isLoading = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   void hidePassword() {
//     obscurePassword.value = !obscurePassword.value;
//   }
//
//   login() async {
//     Get.dialog(const Loader(), barrierDismissible: false);
//     isLoading.value = true;
//     try {
//       LoginModel user = LoginModel(
//           username: emailController.text.trim(),
//           password: passwordController.text);
//       user = await LoginRepository().login(user);
//       var stored = await LocalStorageService().setToken(user.token!);
//       Get.offAll(() => CampaignsView());
//     } catch (e) {
//       Get.back();
//     }
//   }
// }
