import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/mode/todo.dart';
import 'package:todo_riv/pages/widgets/todo_item.dart';
import 'package:todo_riv/providers/filtered_todos_provider.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Todo> filteredTodos = ref.watch(filteredTodosProvider);
    return ListView.builder(
      itemBuilder: (_, index) {
        final todo = filteredTodos[index];
        return TodoItem(todo: todo);
      },
      itemCount: filteredTodos.length,
    );
  }
}
