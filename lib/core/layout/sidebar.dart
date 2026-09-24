import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/app_theme.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required this.sections,
    required this.activeSection,
    required this.onSectionTap,
  });

  final List<SidebarSection> sections;
  final int activeSection;
  final ValueChanged<int> onSectionTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: 300,
      height: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: Border(
          right: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            _buildProfile(isDark),
            const SizedBox(height: 32),
            _buildNavItems(theme, isDark),
            const Spacer(),
            _buildSocialLinks(colorScheme),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(bool isDark) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.accent,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 45,
            backgroundColor: isDark ? AppColors.cardDark : AppColors.cardLight,
            backgroundImage: const AssetImage('assets/images/Asser2.jpg'),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Asser Mohammed',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Flutter Developer',
          style: TextStyle(
            fontSize: 14,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildNavItems(ThemeData theme, bool isDark) {
    return Column(
      children: List.generate(sections.length, (index) {
        final section = sections[index];
        final isActive = index == activeSection;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => onSectionTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.accent.withValues(alpha: isDark ? 0.2 : 0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      section.icon,
                      size: 20,
                      color: isActive
                          ? AppColors.accent
                          : (isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        section.label,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                          color: isActive
                              ? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight)
                              : (isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                        ),
                      ),
                    ),
                    if (isActive)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSocialLinks(ColorScheme _) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SocialIcon(
            icon: Icons.code,
            url: 'https://github.com/asaerxd6767',
            tooltip: 'GitHub',
          ),
          const SizedBox(width: 12),
          _SocialIcon(
            icon: Icons.work,
            url: 'https://linkedin.com/in/asser-mohammed',
            tooltip: 'LinkedIn',
          ),
          const SizedBox(width: 12),
          _SocialIcon(
            icon: Icons.sports,
            url: 'https://codeforces.com/profile/asser_mohammed',
            tooltip: 'Codeforces',
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  final IconData icon;
  final String url;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => launchUrl(Uri.parse(url)),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              icon,
              size: 18,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ),
      ),
    );
  }
}

class SidebarSection {
  const SidebarSection({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}
