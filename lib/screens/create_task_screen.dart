import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/widgets/widgets.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(
          BuildContext buildContext, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Add New Task'),
      ),
      body: StretchingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextFiled(
                title: 'Task Title',
                hintTitle: 'Task Title',
                controller: TextEditingController(),
              ),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              CommonTextFiled(
                title: 'Task Title',
                hintTitle: 'Task Title',
                maxLines: 6,
                controller: TextEditingController(),
              ),
              const Gap(60),
              ElevatedButton(
                  onPressed: () {},
                  child: const DisplayWhiteText(text: 'Save')),
            ],
          ),
        ),
      ),
    );
  }
}
