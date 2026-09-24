import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/animations/fade_in_wrapper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/responsive/responsive_builder.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(context);
    final theme = Theme.of(context);

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
              title: "Let's Connect",
              subtitle: "Got a project in mind? Let's talk about it.",
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.accent, AppColors.accentDark],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: isMobile
                  ? Column(
                      children: [
                        _buildContactContent(theme, true),
                        const SizedBox(height: 24),
                        _buildContactButtons(context, true),
                      ],
                    )
                  : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                        children: [
                          Expanded(child: _buildContactContent(theme, false)),
                          _buildContactButtons(context, false),
                        ],
                      ),
                  ),
            ),
            const SizedBox(height: 32),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactContent(ThemeData theme, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        const Text(
          'Get In Touch',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "I'm always open to discussing new projects, creative ideas, or opportunities to be part of your vision.",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.9),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildContactButtons(BuildContext context, bool isVertical) {
    final buttons = [
      _ContactAction(
        icon: Icons.email,
        label: 'Email Me',
        onTap: () => launchUrl(Uri.parse('mailto:mohammedasser070@gmail.com')),
      ),
      _ContactAction(
        icon: Icons.phone,
        label: 'Call Me',
        onTap: () => launchUrl(Uri.parse('tel:+201040920123')),
      ),
      _ContactAction(
        icon: Icons.work,
        label: 'LinkedIn',
        onTap: () =>
            launchUrl(Uri.parse('https://linkedin.com/in/asser-mohammed')),
      ),
    ];

    if (isVertical) {
      return Column(
        children: buttons.map((btn) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(width: double.infinity, child: _buildButton(btn)),
          );
        }).toList(),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: buttons.map((btn) {
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: _buildButton(btn),
        );
      }).toList(),
    );
  }

  Widget _buildButton(_ContactAction action) {
    return Material(
      color: Colors.white.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: action.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(action.icon, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(
                action.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
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
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Asser Mohammed',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                Text(
                  'Flutter Developer & CS Student',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _FooterLink(
                  url: 'https://github.com/asaerxd6767',
                  icon: Icons.code,
                ),
                const SizedBox(width: 12),
                _FooterLink(
                  url: 'https://linkedin.com/in/asser-mohammed',
                  icon: Icons.work,
                ),
                const SizedBox(width: 12),
                _FooterLink(
                  url: 'https://codeforces.com/profile/asser_mohammed',
                  icon: Icons.sports,
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

class _ContactAction {
  const _ContactAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.url, required this.icon});

  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: isDark ? AppColors.borderDark : AppColors.borderLight,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => launchUrl(Uri.parse(url)),
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(
            icon,
            size: 16,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
      ),
    );
  }
}
