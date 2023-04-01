// import 'package:flutter/material.dart';
// import 'package:lms_project/config/config.dart';
// import 'package:lms_project/utils/ui/ui.dart';
// import 'package:sizer/sizer.dart';
//
// class PrimaryButton extends StatelessWidget {
//   final String text;
//   final double? width;
//   final Function onTap;
//   var color;
//
//   PrimaryButton({
//     Key? key,
//     required this.text,
//     this.width,
//     required this.onTap,
//     this.color,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         onTap.call();
//       },
//       style: ButtonStyle(
//         backgroundColor:
//             MaterialStateProperty.all(color ?? AppColors().secondary),
//         minimumSize: MaterialStateProperty.all<Size>(
//           Size(width ?? double.infinity, 40.sp),
//         ),
//         maximumSize: MaterialStateProperty.all<Size>(
//           Size(width ?? double.infinity, 40.sp),
//         ),
//       ),
//       child: CustomText(
//         text: text,
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }
