import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_flutter/utils/extensions.dart';

import '../data/models/models.dart';
import '../providers/providers.dart';

class AppAlerts {
  AppAlerts._();

  static void displaySnackBar(String error, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error,
          style: context.textTheme.bodyLarge
              ?.copyWith(color: context.colorScheme.surface),
        ),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

  static Future<void> deleteDialogTask(
      BuildContext context, WidgetRef ref, Task task) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Are you sure you want to delete this task?',
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 20),
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        final taskNotifier = ref.read(taskProvider.notifier);
                        await taskNotifier.deleteTask(task).then((value) {
                          Navigator.of(context).pop();
                          AppAlerts.displaySnackBar(
                              'The task is deleted successfully', context);
                        }).catchError((value, stack) {
                          AppAlerts.displaySnackBar(value.toString(), context);
                        });
                      },
                      child: Text(
                        'YES',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                    const Gap(5),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'NO',
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: context.colorScheme.primary),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
