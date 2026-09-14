import 'package:flutter/material.dart';

class SkillChipWrap extends StatelessWidget {
  const SkillChipWrap({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in items)
          Chip(
            label: Text(item),
            backgroundColor: colorScheme.secondaryContainer,
            side: BorderSide.none,
          ),
      ],
    );
  }
}
