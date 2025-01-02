import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchFilterNotifier extends StateNotifier<String> {
  SearchFilterNotifier() : super('');

  void setSearchTerm({required String searchTerm}) {
    state = searchTerm;
  }
}

final searchFilterProvider =
    StateNotifierProvider<SearchFilterNotifier, String>(
        (ref) => SearchFilterNotifier());
