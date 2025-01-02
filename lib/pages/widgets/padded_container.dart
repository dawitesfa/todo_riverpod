// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PaddedContainer extends StatelessWidget {
  const PaddedContainer({
    super.key,
    required this.children,
  });
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: children,
    );
  }
}
