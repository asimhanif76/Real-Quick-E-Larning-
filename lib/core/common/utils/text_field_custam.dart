import 'package:e_learning/core/Extension/extension.dart';
import 'package:e_learning/core/common/app_text.dart';
import 'package:e_learning/core/common/utils/Themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? title;
  final String? labelText;
  final Widget? startIcon;
  final Widget? lastIcon;
  final bool? obscur;
  final VoidCallback? fun;
  final bool? focus;
  final bool isValid;
  final bool? boarder;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxline;
  final bool filled;
  final bool readOnly;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.title = ' ',
    this.controller,
    this.labelText,
    this.lastIcon,
    this.obscur = false,
    this.startIcon,
    this.keyboardType,
    this.fun,
    this.focus = false,
    this.isValid = true,
    this.boarder = false,
    this.maxline = 1,
    this.filled = true,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(title: '  $title'),
        1.h.height,
        SizedBox(
          height: 5.7.h,
          width: double.infinity,
          child: TextField(
            readOnly: readOnly,
            autofocus: focus!,
            obscureText: obscur!,
            keyboardType: keyboardType,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'nunito',
              color: AppColors.black,
            ),
            controller: controller,
            cursorColor: AppColors.primaryColor,
            maxLines: maxline,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: lastIcon,
              prefixIcon: startIcon,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 0,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black54,
                fontFamily: 'nunito',
              ),
              filled: filled,
              fillColor: Color(0xffFCFCFC), //fillColorShow! ? fillColor : null,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: AppColors.gray),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



// void validateInput() {
//     setState(() {
//       controller.isEmailValid = RegExp(
//         r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
//       ).hasMatch(controller.email.text.trim());
//       controller.isPasswordValid = controller.password.text.trim().length >= 6;
//     });
//   }



  // bool isEmailValid = true;
  // bool isPasswordValid = true;
//  CustomTextField(
//                 controller: controller.email,
//                 hintText: 'Enter Your Email',
//                 keyboardType: TextInputType.emailAddress,
//                 isValid: controller.isEmailValid,
//                 onChanged: (_) => validateInput(),
//               ),