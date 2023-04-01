// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lms_project/config/config.dart';
// import 'package:lms_project/constants/constants.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../main.dart';
// import '../../../utils/ui/buttons/primary_button.dart';
// import '../../../utils/ui/textfields/custom_textfield.dart';
// import '../../../utils/ui/ui.dart';
// import '../controller/login_controller.dart';
// import '../widgets/password_visibility.dart';
//
// class LoginView extends StatelessWidget {
//   LoginView({Key? key}) : super(key: key);
//
//   final LoginController _controller = Get.put(LoginController());
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     setStatusBarIconsColor(context: context);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Form(
//         key: _formKey,
//         child: SafeArea(
//             child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 10.h,
//               ),
//               CustomText(
//                 text: 'Log In',
//                 fontSize: 32,
//                 color: Theme.of(context).colorScheme.onPrimary,
//                 fontWeight: FontWeight.w700,
//               ),
//               CustomText(
//                 text: 'Enter your details below.',
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//                 color: Theme.of(context).colorScheme.onPrimary,
//               ),
//               SizedBox(
//                 height: 6.h,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: CustomText(
//                   text: 'Your Email',
//                   fontSize: 14,
//                   color: AppColors().grey,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               CustomTextField(
//                 controller: _controller.emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 validationFunction: (value) {
//                   if (value == "" || value.isNull) {
//                     return "Please type correct email";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 15.sp,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: CustomText(
//                   text: 'Password',
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: AppColors().grey,
//                 ),
//               ),
//               Obx(() => CustomTextField(
//                     controller: _controller.passwordController,
//                     obscureText: _controller.obscurePassword.value,
//                     suffixIcon: PasswordVisibility(
//                       obscurePassword: _controller.obscurePassword.value,
//                       onTap: _controller.hidePassword,
//                     ),
//                   )),
//               SizedBox(
//                 height: 10.sp,
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: CustomText(
//                   text: 'Forget password?',
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: AppColors().grey,
//                 ),
//               ),
//               const Spacer(),
//               PrimaryButton(
//                 text: 'Log In',
//                 onTap: () {
//                   _controller.login();
//                 },
//               ),
//               SizedBox(
//                 height: 4.w,
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }
