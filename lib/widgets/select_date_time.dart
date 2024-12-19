import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_flutter/providers/providers.dart';
import 'package:todo_app_flutter/utils/utils.dart';

import 'common_text_filed.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextFiled(
            title: 'Date',
            hintTitle: DateFormat.yMMMd().format(date),
            controller: TextEditingController(),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () async => await Helper.selectDate(context, ref),
              icon: const FaIcon(FontAwesomeIcons.calendar),
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: CommonTextFiled(
            title: 'Time',
            hintTitle: Helper.timeToString(time),
            controller: TextEditingController(),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () async => await Helper.selectTime(context, ref),
              icon: const FaIcon(FontAwesomeIcons.clock),
            ),
          ),
        ),
      ],
    );
  }
}
