import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_flutter/providers/providers.dart';
import 'package:todo_app_flutter/utils/utils.dart';

import 'circle_container.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    const categories = TaskCategory.values;
    final colors = context.colorScheme;
    final textTheme = context.textTheme;
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: textTheme.titleLarge,
          ),
          const Gap(8),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Gap(8),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => SizedBox(
                height: 48,
                width: 48,
                child: CircleContainer(
                  borderColor: categories[index].color.withOpacity(0.5),
                  backgroundColor: categories[index].color.withOpacity(0.3),
                  child: Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        ref.read(categoryProvider.notifier).state =
                            categories[index];
                      },
                      child: Icon(
                        categories[index].icon,
                        color: selectedCategory == categories[index]
                            ? colors.primary
                            : categories[index].color.withOpacity(0.5),
                      ),
                    ),
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
