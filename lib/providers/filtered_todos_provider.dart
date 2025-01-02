// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_riv/model/todo.dart';
import 'package:todo_riv/providers/search_filter_provider.dart';
import 'package:todo_riv/providers/todo_filter_provider.dart';
import 'package:todo_riv/providers/todos_provider.dart';

class FilteredTodosNotifier extends StateNotifier<List<Todo>> {
  final Object? _todoFilterState;
  final Object? _searchState;
  final Object? _todosState;
  FilteredTodosNotifier(
    this._todoFilterState,
    this._searchState,
    this._todosState,
  ) : super([]) {
    updateFilteredTodos();
  }

  void updateFilteredTodos() {
    List<Todo> filteredTodos = [];
    switch (_todoFilterState as TodoFilter) {
      case TodoFilter.active:
        filteredTodos = (_todosState as List<Todo>)
            .where((todo) => !todo.isCompleted)
            .toList();
        break;
      case TodoFilter.completed:
        filteredTodos = (_todosState as List<Todo>)
            .where((todo) => todo.isCompleted)
            .toList();
        break;
      case TodoFilter.all:
        filteredTodos = (_todosState as List<Todo>);
    }

    if (_searchState != null) {
      filteredTodos = filteredTodos
          .where((todo) => todo.desc
              .toLowerCase()
              .contains((_searchState as String).toLowerCase()))
          .toList();
    }

    state = filteredTodos;
  }
}

final filteredTodosProvider =
    StateNotifierProvider<FilteredTodosNotifier, List<Todo>>((ref) {
  return FilteredTodosNotifier(
    ref.watch(todoFilterProvider),
    ref.watch(searchFilterProvider),
    ref.watch(todosProvider),
  );
});
