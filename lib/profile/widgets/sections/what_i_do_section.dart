import 'package:flutter/material.dart';

import '../../../core/animations/fade_in_wrapper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/responsive/responsive_builder.dart';

class WhatIDoSection extends StatelessWidget {
  const WhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);

    return FadeInOnScroll(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(
              title: 'What I Do',
              subtitle: 'My core areas of expertise',
            ),
            const SizedBox(height: 24),
            isMobile
                ? Column(
                    children: [
                      _ServiceCard(
                        icon: Icons.phone_iphone,
                        title: 'Mobile Development',
                        description:
                            'Crafting beautiful, performant mobile applications with Flutter and Dart. From pixel-perfect UIs to robust backend integrations.',
                        tags: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
                      ),
                      const SizedBox(height: 16),
                      _ServiceCard(
                        icon: Icons.psychology,
                        title: 'Problem Solving',
                        description:
                            'Competitive programmer with 650+ problems solved. Strong foundations in algorithms, data structures, and computational thinking.',
                        tags: [
                          'C++',
                          'Python',
                          'Algorithms',
                          'Data Structures',
                        ],
                      ),
                      const SizedBox(height: 16),
                      _ServiceCard(
                        icon: Icons.groups,
                        title: 'Teaching & Leadership',
                        description:
                            'Mentoring students in programming, leading technical communities, and bridging the gap between theory and practice.',
                        tags: ['ICPC Mentor', 'Batch Leader', 'ICPC'],
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _ServiceCard(
                          icon: Icons.phone_iphone,
                          title: 'Mobile Development',
                          description:
                              'Crafting beautiful, performant mobile applications with Flutter and Dart. From pixel-perfect UIs to robust backend integrations.',
                          tags: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _ServiceCard(
                          icon: Icons.psychology,
                          title: 'Problem Solving',
                          description:
                              'Competitive programmer with 650+ problems solved. Strong foundations in algorithms, data structures, and computational thinking.',
                          tags: [
                            'C++',
                            'Python',
                            'Algorithms',
                            'Data Structures',
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _ServiceCard(
                          icon: Icons.groups,
                          title: 'Teaching & Leadership',
                          description:
                              'Mentoring students in programming, leading technical communities, and bridging the gap between theory and practice.',
                          tags: ['ICPC Mentor', 'Batch Leader', 'ICPC'],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatefulWidget {
  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
  });

  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.translationValues(0, -4, 0))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : AppColors.cardLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.accent.withValues(alpha: 0.5)
                : (isDark ? AppColors.borderDark : AppColors.borderLight),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.1),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: isDark ? 0.2 : 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, color: AppColors.accent, size: 24),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(
                      alpha: isDark ? 0.15 : 0.08,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accent,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
