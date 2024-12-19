import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_flutter/utils/extensions.dart';

class CommonTextFiled extends StatelessWidget {
  const CommonTextFiled(
      {required this.title,
      required this.hintTitle,
      required this.controller,
      this.maxLines,
      this.suffixIcon,
      this.readOnly = false,
      super.key});
  final String title;
  final String hintTitle;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: textTheme.titleLarge,
        ),
        const Gap(10),
        TextField(
          decoration:
              InputDecoration(hintText: hintTitle, suffixIcon: suffixIcon),
          maxLines: maxLines,
          readOnly: readOnly,
          controller: controller,
          onChanged: (val) {},
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        )
      ],
    );
  }
}
