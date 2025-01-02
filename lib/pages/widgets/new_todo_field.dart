import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/model/todo.dart';
import 'package:todo_riv/providers/todos_provider.dart';

class NewTodoField extends ConsumerStatefulWidget {
  const NewTodoField({super.key});

  @override
  ConsumerState<NewTodoField> createState() => _NewTodoFieldState();
}

class _NewTodoFieldState extends ConsumerState<NewTodoField> {
  final _todoDescController = TextEditingController();

  @override
  void dispose() {
    _todoDescController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: 'New task'),
      controller: _todoDescController,
      onSubmitted: (String? desc) {
        if (desc == null || desc.isEmpty) return;
        _todoDescController.clear();
        final todo = Todo(desc: desc);
        ref.read(todosProvider.notifier).addTodo(todo: todo);
      },
    );
  }
}
