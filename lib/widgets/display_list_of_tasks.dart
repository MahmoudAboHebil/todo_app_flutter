import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/utils.dart';

import '../data/models/models.dart';
import 'common_container.dart';
import 'task_tile.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks({
    required this.tasks,
    this.isCompleted = false,
    super.key,
  }) : showEmptyString = isCompleted
            ? 'There is no completed task yet'
            : 'There is no task to todo!';
  final List<Task> tasks;
  final bool isCompleted;
  final String showEmptyString;

  @override
  Widget build(BuildContext context) {
    // final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final textTheme = context.textTheme;
    final height =
        isCompleted ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                showEmptyString,
                style: textTheme.headlineSmall,
              ),
            )
          : StretchingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskTile(task: task);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1.5,
                  );
                },
                itemCount: tasks.length,
              ),
            ),
    );
  }
}