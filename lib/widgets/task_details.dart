import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_flutter/data/data.dart';
import 'package:todo_app_flutter/data/models/task.dart';
import 'package:todo_app_flutter/utils/utils.dart';

import 'circle_container.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({required this.task, super.key});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            backgroundColor: task.category.color.withOpacity(0.3),
            borderColor: task.category.color,
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            task.time,
            style: textTheme.bodyLarge,
          ),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Task to be completed in ${task.date}',
                  style: textTheme.bodyMedium,
                ),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                )
              ],
            ),
          ),
          const Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          const Gap(16),
          Text(
            task.note.isEmpty
                ? 'There is no additional note for this task'
                : task.note,
            style: textTheme.bodyLarge,
          ),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Task Completed',
                  style: textTheme.bodyLarge,
                ),
                const Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
