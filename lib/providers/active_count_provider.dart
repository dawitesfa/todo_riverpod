// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/mode/todo.dart';

import 'package:todo_riv/providers/todos_provider.dart';

class ActiveCounterNotifier extends StateNotifier<int> {
  final Object? _todos;
  ActiveCounterNotifier(
    this._todos,
  ) : super(0) {
    state = _todos == null
        ? 0
        : (_todos as List<Todo>)
            .where((todo) => !todo.isCompleted)
            .toList()
            .length;
  }
}

final StateNotifierProvider activeCounterProvider = StateNotifierProvider(
  (ref) => ActiveCounterNotifier(ref.watch(todosProvider)),
);
