import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riv/providers/search_filter_provider.dart';

class CustomSearch extends ConsumerWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: 'Search'),
        onChanged: (String searchTerm) {
          ref
              .read(searchFilterProvider.notifier)
              .setSearchTerm(searchTerm: searchTerm);
        },
      ),
    );
  }
}
