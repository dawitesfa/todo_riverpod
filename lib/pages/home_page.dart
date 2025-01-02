import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/pages/widgets/custom_search.dart';
import 'package:todo_riv/pages/widgets/filter_widget.dart';
import 'package:todo_riv/pages/widgets/new_todo_field.dart';
import 'package:todo_riv/pages/widgets/padded_container.dart';
import 'package:todo_riv/pages/widgets/todo_list.dart';
import 'package:todo_riv/providers/active_count_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeCounter = ref.watch(activeCounterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
              textStyle: TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () {},
            child: Text(
              '$activeCounter tasks left',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          PaddedContainer(children: NewTodoField()),
          PaddedContainer(children: CustomSearch()),
          PaddedContainer(children: FilterHeader()),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
