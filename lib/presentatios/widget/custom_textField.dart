// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_fixed/core/them/app_them.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final AppTheme? color;
  final bool isobscure;
  final String? isnValid;
  final VoidCallback? onSuffixpressed;
  final String? Function(String?)? validator;

  const CustomTextfield({
    super.key,
    required this.hintText,

    required this.controller,
    this.validator,
    this.color,
    this.isobscure = false,
    this.isnValid,
    this.onSuffixpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        obscureText: isobscure,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: onSuffixpressed != null
              ? IconButton(
                  onPressed: onSuffixpressed,
                  icon: Icon(
                    isobscure
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                )
              : null,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppTheme.primaryBlack),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppTheme.lightGrey),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
