import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/config/config.dart';
import 'package:todo_app_flutter/data/data.dart';
import 'package:todo_app_flutter/providers/providers.dart';
import 'package:todo_app_flutter/utils/utils.dart';
import 'package:todo_app_flutter/widgets/widgets.dart';

class CreateTaskScreen extends ConsumerWidget {
  static CreateTaskScreen builder(
          BuildContext buildContext, GoRouterState state) =>
      CreateTaskScreen();
  CreateTaskScreen({super.key});

  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNotifierProvider = ref.watch(taskProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Add New Task'),
      ),
      body: SafeArea(
        child: StretchingOverscrollIndicator(
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
                  controller: _titleController,
                ),
                const Gap(16),
                const SelectCategory(),
                const Gap(16),
                const SelectDateTime(),
                const Gap(16),
                CommonTextFiled(
                  title: 'Notes',
                  hintTitle: 'Notes',
                  maxLines: 6,
                  controller: _noteController,
                ),
                const Gap(60),
                ElevatedButton(
                    onPressed: () async {
                      await _createTask(ref, context);
                    },
                    child: const DisplayWhiteText(text: 'Save')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createTask(WidgetRef ref, BuildContext context) async {
    final _timeProvider = ref.watch(timeProvider.notifier).state;
    final _dateProvider = ref.watch(dateProvider.notifier).state;
    final _categoryProvider = ref.watch(categoryProvider.notifier).state;
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    print('''
      category: ${_categoryProvider},
        title: ${_titleController.text},
        time: ${Helper.timeToString(_timeProvider)},
        date: ${DateFormat.yMMMd().format(_dateProvider)},
        note: ${note ?? ''},
        isCompleted: false,
    
    ''');
    if (title.isNotEmpty) {
      final task = Task(
        id: null,
        category: _categoryProvider,
        title: _titleController.text,
        time: Helper.timeToString(_timeProvider),
        date: DateFormat.yMMMd().format(_dateProvider),
        note: note ?? '',
        isCompleted: false,
      );
      await ref.read(taskProvider.notifier).addTask(task).then((value) {
        context.go(RouteLocation.home);
        AppAlerts.displaySnackBar('Task is created successfully', context);
      }).catchError((value, stack) {
        AppAlerts.displaySnackBar(value.toString(), context);
      });
    } else {
      AppAlerts.displaySnackBar('Title can not be empty', context);
    }
  }
}
