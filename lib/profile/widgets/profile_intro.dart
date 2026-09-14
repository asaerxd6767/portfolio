import 'package:flutter/material.dart';

import 'typing_animated_text.dart';

class ProfileIntro extends StatelessWidget {
  const ProfileIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TypingAnimatedText(
              texts: const [
                'Flutter Developer',
                'Competitive Programmer',
                'CS & AI Student',
              ],
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Computer Science and Artificial Intelligence student at Minia National University with strong foundations in software engineering, competitive programming, and mobile application development. Experienced in mentoring students, leading technical communities, and building projects using Flutter, C++, Python, SQL, and Firebase.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.5,
                color: colorScheme.onSurface.withValues(alpha: 0.82),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
