import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/model/todo.dart';
import 'package:todo_riv/providers/todos_provider.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;
  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: GlobalKey(debugLabel: todo.id),
      onDismissed: (_) {
        ref.read(todosProvider.notifier).remodeTodo(id: todo.id);
      },
      child: CheckboxListTile.adaptive(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(todo.desc),
        value: todo.isCompleted,
        onChanged: (_) {
          ref.read(todosProvider.notifier).toggleCompleted(id: todo.id);
        },
      ),
    );
  }
}
