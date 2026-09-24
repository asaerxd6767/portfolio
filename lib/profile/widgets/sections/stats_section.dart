import 'package:flutter/material.dart';

import '../../../core/animations/fade_in_wrapper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/responsive/responsive_builder.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);

    return FadeInOnScroll(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 16,
        ),
        child: isMobile ? _buildMobileGrid(context) : _buildDesktopRow(context),
      ),
    );
  }

  Widget _buildDesktopRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        children: [
          _StatItem(
            label: 'Problems Solved',
            value: '650+',
            icon: Icons.code,
            description: 'Codeforces & LeetCode',
          ),
          const SizedBox(width: 16),
          _StatItem(
            label: 'Students Mentored',
            value: '30+',
            icon: Icons.people_outline,
            description: 'ICPC MNU Community',
          ),
          const SizedBox(width: 16),
          _StatItem(
            label: 'Batch Represented',
            value: '400+',
            icon: Icons.school_outlined,
            description: 'Student Representative',
          ),
          const SizedBox(width: 16),
          _StatItem(
            label: 'Projects Built',
            value: '5+',
            icon: Icons.rocket_launch_outlined,
            description: 'Shipped & In Progress',
          ),
        ],
      ),
    );
  }

  Widget _buildMobileGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _StatItem(
          label: 'Problems Solved',
          value: '650+',
          icon: Icons.code,
          description: 'Codeforces & LeetCode',
        ),
        _StatItem(
          label: 'Students Mentored',
          value: '30+',
          icon: Icons.people_outline,
          description: 'ICPC MNU Community',
        ),
        _StatItem(
          label: 'Batch Represented',
          value: '400+',
          icon: Icons.school_outlined,
          description: 'Student Representative',
        ),
        _StatItem(
          label: 'Projects Built',
          value: '5+',
          icon: Icons.rocket_launch_outlined,
          description: 'Shipped & In Progress',
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.description,
  });

  final String label;
  final String value;
  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: isDark ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.accent, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
          ),
          Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
