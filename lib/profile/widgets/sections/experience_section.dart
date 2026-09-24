import 'package:flutter/material.dart';

import '../../../core/animations/fade_in_wrapper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/responsive/responsive_builder.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
              title: 'Experience',
              subtitle: 'My professional journey so far',
            ),
            const SizedBox(height: 24),
            _Timeline(
              items: const [
                _TimelineItem(
                  title: 'ICPC MNU Community',
                  role: 'Vice Training Head & Mentor',
                  period: 'Oct 2025 - Present',
                  description:
                      'Mentored 30+ students in competitive programming and algorithmic problem solving. Prepared training materials covering data structures, algorithms, and contest strategies. Reviewed solutions and provided technical feedback.',
                  icon: Icons.groups,
                  accentColor: Color(0xFF10B981),
                  image: 'assets/images/ICPC_MNU.jpg',
                ),
                _TimelineItem(
                  title: 'Minia National University',
                  role: 'Student Representative / Batch Leader',
                  period: 'Oct 2025 - Present',
                  description:
                      'Represented 400+ students between faculty administration and students. Managed communication, schedules, announcements, and academic services. Organized Server Lab activities.',
                  icon: Icons.school_outlined,
                  accentColor: Color(0xFF06B6D4),
                ),
                _TimelineItem(
                  title: 'Tech Mastery',
                  role: 'Flutter Developer Intern',
                  period: '2025',
                  description:
                      'Completed Flutter internship with Agile methodology. Worked on Leo Clinic project with real backend API integration. Created 30-day Flutter study plan. Connected app screens to real API data.',
                  icon: Icons.code,
                  accentColor: Color(0xFF8B5CF6),
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

class _Timeline extends StatelessWidget {
  const _Timeline({required this.items});

  final List<_TimelineItem> items;

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        final isLast = index == items.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 48,
                child: Column(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: item.accentColor.withValues(
                          alpha: isDark ? 0.2 : 0.1,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: item.accentColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Icon(item.icon, color: item.accentColor, size: 20),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: isDark
                              ? AppColors.borderDark
                              : AppColors.borderLight,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: isLast ? 0 : 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.cardDark : AppColors.cardLight,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark
                          ? AppColors.borderDark
                          : AppColors.borderLight,
                    ),
                  ),
                  child: _buildCardContent(theme, isDark, item, isMobile),
                ),
              ),
              if (isMobile)
                const SizedBox(width: 0)
              else
                const SizedBox(width: 48),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCardContent(ThemeData theme, bool isDark, _TimelineItem item, bool isMobile) {
    final info = _buildCardInfo(theme, isDark, item);
    if (item.image == null) return info;

    final image = _buildCardImage(isDark, item, isMobile);

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          info,
          const SizedBox(height: 12),
          image,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: info),
        const SizedBox(width: 16),
        image,
      ],
    );
  }

  Widget _buildCardInfo(ThemeData theme, bool isDark, _TimelineItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: item.accentColor.withValues(
                  alpha: isDark ? 0.15 : 0.08,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                item.period,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: item.accentColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          item.role,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        Text(
          item.title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: item.accentColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildCardImage(bool isDark, _TimelineItem item, bool isMobile) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: isMobile ? double.infinity : 320,
        height: isMobile ? 220 : 200,
        child: ColoredBox(
          color: isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6),
          child: Image.asset(
            item.image!,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class _TimelineItem {
  const _TimelineItem({
    required this.title,
    required this.role,
    required this.period,
    required this.description,
    required this.icon,
    required this.accentColor,
    this.image,
  });

  final String title;
  final String role;
  final String period;
  final String description;
  final IconData icon;
  final Color accentColor;
  final String? image;
}
