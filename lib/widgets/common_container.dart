import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/utils.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({this.child, this.height, super.key});
  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Container(
      width: deviceSize.width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors.primaryContainer,
      ),
      child: child,
    );
  }
}
