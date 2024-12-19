import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/config/config.dart';
import 'package:todo_app_flutter/providers/providers.dart';
import 'package:todo_app_flutter/utils/utils.dart';
import 'package:todo_app_flutter/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext buildContext, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNotifier = ref.watch(taskProvider);
    final selectedDate = ref.watch(dateProvider);
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final textTheme = context.textTheme;
    final notCompetedTasks = Helper.getNotCompletedTasks(taskNotifier.tasks)
        .where((task) => Helper.isTaskInSelectedDate(context, task, ref))
        .toList();
    final competedTasks = Helper.getCompletedTasks(taskNotifier.tasks)
        .where((task) => Helper.isTaskInSelectedDate(context, task, ref))
        .toList();
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Helper.selectDate(context, ref);
                      },
                      child: DisplayWhiteText(
                        text: DateFormat.yMMMd().format(selectedDate),
                        fontSize: 20,
                        weight: FontWeight.normal,
                      ),
                    ),
                    const Gap(10),
                    const DisplayWhiteText(
                      text: 'My Todo List',
                      fontSize: 40,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: deviceSize.height * 0.18,
            right: 0,
            left: 0,
            bottom: 0,
            child: SafeArea(
              child: StretchingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DisplayListOfTasks(
                        tasks: notCompetedTasks,
                      ),
                      const Gap(20),
                      Text(
                        'Completed',
                        style: textTheme.headlineMedium,
                      ),
                      const Gap(20),
                      DisplayListOfTasks(
                        tasks: competedTasks,
                        isCompleted: true,
                      ),
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () {
                          context.push(RouteLocation.createTask);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayWhiteText(
                            text: 'Add new Task',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
