import 'package:flutter/material.dart';

import '../../../core/animations/fade_in_wrapper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/responsive/responsive_builder.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

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
              title: 'Tech Stack',
              subtitle: 'Technologies I work with',
            ),
            const SizedBox(height: 24),
            _buildCategories(context, isMobile),
            const SizedBox(height: 24),
            _buildEducationCard(context),
            const SizedBox(height: 16),
            _buildCertCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context, bool isMobile) {
    final categories = [
      _TechCategory(
        title: 'Languages',
        icon: Icons.code,
        items: [
          _TechItem('Dart', Icons.flutter_dash),
          _TechItem('Python', Icons.science),
          _TechItem('C++', Icons.memory),
          _TechItem('JavaScript', Icons.javascript),
          _TechItem('SQL', Icons.storage),
        ],
      ),
      _TechCategory(
        title: 'Frameworks',
        icon: Icons.phonelink_setup,
        items: [
          _TechItem('Flutter', Icons.phone_iphone),
          _TechItem('Firebase', Icons.local_fire_department),
          _TechItem('REST APIs', Icons.api),
        ],
      ),
      _TechCategory(
        title: 'Tools',
        icon: Icons.build,
        items: [
          _TechItem('Git', Icons.device_hub),
          _TechItem('GitHub', Icons.code),
          _TechItem('VS Code', Icons.edit),
          _TechItem('Figma', Icons.design_services),
        ],
      ),
    ];

    if (isMobile) {
      return Column(
        children: categories.map((cat) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _TechCategoryCard(category: cat),
          );
        }).toList(),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: categories.map((cat) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: _TechCategoryCard(category: cat),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEducationCard(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: isDark ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.school_outlined,
              color: AppColors.accent,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'B.Sc. Computer Science & AI',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                Text(
                  'Minia National University — Expected 2028',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Data Structures, Algorithms, OOP, AI, Machine Learning, Database Systems, Software Engineering',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertCard(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(
                0xFFCE0E2D,
              ).withValues(alpha: isDark ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.verified,
              color: Color(0xFFCE0E2D),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Huawei ICT Academy — Overview of AI',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                Text(
                  'Certified · Sep 2026',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFFCE0E2D),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/huawei_ai_cert.png',
              height: 48,
              width: 48,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
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

class _TechCategoryCard extends StatelessWidget {
  const _TechCategoryCard({required this.category});

  final _TechCategory category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(category.icon, size: 20, color: AppColors.accent),
              const SizedBox(width: 8),
              Text(
                category.title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...category.items.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    size: 16,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TechCategory {
  const _TechCategory({
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<_TechItem> items;
}

class _TechItem {
  const _TechItem(this.name, this.icon);

  final String name;
  final IconData icon;
}
