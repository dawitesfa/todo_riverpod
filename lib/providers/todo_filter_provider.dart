import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/mode/todo.dart';

class TodoFilterNotifier extends StateNotifier<TodoFilter> {
  TodoFilterNotifier() : super(TodoFilter.all);

  void updateFilter({required TodoFilter filter}) {
    state = filter;
  }
}

final todoFilterProvider = StateNotifierProvider((ref) => TodoFilterNotifier());
