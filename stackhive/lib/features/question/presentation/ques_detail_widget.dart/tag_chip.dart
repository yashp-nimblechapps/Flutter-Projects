import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String tag;

  const TagChip({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tag,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
