import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_flutter/data/data.dart';
import 'package:todo_app_flutter/utils/utils.dart';
import 'package:todo_app_flutter/widgets/circle_container.dart';

class TaskTile extends StatelessWidget {
  TaskTile({required this.task, this.onCompleted, super.key})
      : iconOpacity = task.isCompleted ? 0.3 : 0.5,
        weight = task.isCompleted ? FontWeight.normal : FontWeight.bold,
        backgroundOpacity = task.isCompleted ? 0.1 : 0.3,
        textDecoration =
            task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
  final Task task;
  final void Function(bool?)? onCompleted;

  final FontWeight weight;
  final double iconOpacity;
  final double backgroundOpacity;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    // final colors = context.colorScheme;
    // final deviceSize = context.deviceSize;
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            backgroundColor: task.category.color.withOpacity(backgroundOpacity),
            borderColor: task.category.color.withOpacity(iconOpacity),
            child: Icon(
              task.category.icon,
              color: task.category.color.withOpacity(iconOpacity),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: textTheme.titleMedium?.copyWith(
                      decoration: textDecoration,
                      fontSize: 20,
                      fontWeight: weight),
                ),
                Text(
                  task.date,
                  style: textTheme.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: onCompleted,
          ),
        ],
      ),
    );
  }
}
