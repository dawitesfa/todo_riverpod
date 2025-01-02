// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

enum TodoFilter {
  all,
  active,
  completed,
}

class Todo extends Equatable {
  final String id;
  final String desc;
  final bool isCompleted;
  Todo({
    String? id,
    required this.desc,
    this.isCompleted = false,
  }) : id = id ?? uuid.v4();

  Todo copyWith({
    String? id,
    String? desc,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() => 'Todo(id: $id, desc: $desc, isCompleted: $isCompleted)';

  @override
  List<Object> get props => [id, desc, isCompleted];
}
