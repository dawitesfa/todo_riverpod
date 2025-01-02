import 'package:uuid/uuid.dart';

String capitalize({required String word}) {
  if (word.split(' ').length > 1) {
    return word;
  } else if (word.split(' ').length == 1) {
    return '${word[0].toUpperCase()}${word.substring(1)}';
  } else {
    return '';
  }
}

Uuid uuid = const Uuid();
