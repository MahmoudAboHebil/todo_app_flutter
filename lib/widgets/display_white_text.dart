import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/utils.dart';

@immutable
class DisplayWhiteText extends StatelessWidget {
  const DisplayWhiteText({
    required this.text,
    this.fontSize,
    this.weight = FontWeight.bold,
    super.key,
  });
  final String text;
  final FontWeight weight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final textTheme = context.textTheme;
    return Text(
      text,
      style: textTheme.headlineSmall?.copyWith(
        color: colors.surface,
        fontWeight: weight,
        fontSize: fontSize,
      ),
    );
  }
}
