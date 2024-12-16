import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/config/config.dart';
import 'package:todo_app_flutter/data/data.dart';
import 'package:todo_app_flutter/utils/utils.dart';
import 'package:todo_app_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext buildContext, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final textTheme = context.textTheme;
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: 'Dec 14,2024',
                      fontSize: 20,
                      weight: FontWeight.normal,
                    ),
                    Gap(10),
                    DisplayWhiteText(
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
                      const DisplayListOfTasks(
                        tasks: [
                          Task(
                            title: 'title',
                            time: '23:30',
                            date: '1/1/2024',
                            note: '',
                            category: TaskCategory.education,
                            isCompleted: false,
                          ),
                          Task(
                            title: 'title2',
                            time: '10:30',
                            date: '2/1/2024',
                            note: 'note',
                            category: TaskCategory.shopping,
                            isCompleted: false,
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        'Completed',
                        style: textTheme.headlineMedium,
                      ),
                      const Gap(20),
                      const DisplayListOfTasks(
                        tasks: [
                          Task(
                            title: 'title',
                            time: '23:30',
                            date: '1/1/2024',
                            note: '',
                            category: TaskCategory.education,
                            isCompleted: true,
                          ),
                          Task(
                            title: 'title2',
                            time: '10:30',
                            date: '2/1/2024',
                            note: 'note',
                            category: TaskCategory.shopping,
                            isCompleted: true,
                          ),
                        ],
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
