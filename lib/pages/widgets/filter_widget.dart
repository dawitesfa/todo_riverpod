import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/model/todo.dart';
import 'package:todo_riv/providers/todo_filter_provider.dart';
import 'package:todo_riv/utility/utility.dart';

class FilterHeader extends ConsumerWidget {
  const FilterHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(todoFilterProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: TodoFilter.values
          .map(
            (filter) => Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: filter == filterState
                      ? Colors.grey.shade300
                      : Colors.transparent,
                ),
                onPressed: () {
                  ref
                      .read(todoFilterProvider.notifier)
                      .updateFilter(filter: filter);
                },
                child: Text(
                  capitalize(word: filter.name),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
