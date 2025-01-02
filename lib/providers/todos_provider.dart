import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/mode/todo.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void addTodo({required Todo todo}) {
    state = [todo, ...state];
  }

  void toggleCompleted({required String id}) {
    final newTodos = state
        .map((todo) => todo.id == id
            ? todo.copyWith(isCompleted: !todo.isCompleted)
            : todo)
        .toList();
    state = newTodos;
  }

  void remodeTodo({required String id}) {
    final newTodos = state.where((todo) => todo.id != id).toList();
    state = newTodos;
  }
}

final todosProvider = StateNotifierProvider((ref) => TodosNotifier());
