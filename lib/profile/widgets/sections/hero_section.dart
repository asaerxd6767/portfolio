import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/animations/fade_in_wrapper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/layout/portfolio_layout.dart';
import '../typing_animated_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Breakpoints.isMobile(context);

    return FadeInOnScroll(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.9, -0.2),
                  radius: 1.0,
                  colors: [
                    AppColors.accent.withValues(alpha: isDark ? 0.16 : 0.07),
                    AppColors.accent.withValues(alpha: 0),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 32,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: isDark ? 0.2 : 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.accent.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Text(
                    'Available for opportunities',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accent,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Hi, I'm",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Asser Mohammed',
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'I ',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    TypingAnimatedText(
                      texts: const [
                        'build mobile apps',
                        'solve problems',
                        'lead teams',
                        'mentor students',
                      ],
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Text(
                    "CS & AI student at Minia National University. I craft mobile experiences with Flutter, "
                    "compete in programming contests, and lead technical communities. "
                    "Passionate about turning ideas into products that make a difference.",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                      height: 1.7,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: () => PortfolioNavScope.of(context)
                          ?.scrollToLabel('Projects'),
                      icon: const Icon(Icons.arrow_downward, size: 18, color: Colors.white),
                      label: const Text('View Projects'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => launchUrl(Uri.parse('mailto:mohammedasser070@gmail.com')),
                      icon: Icon(
                        Icons.mail_outline,
                        size: 18,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                      label: Text(
                        'Contact Me',
                        style: TextStyle(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                        side: BorderSide(
                          color: isDark ? AppColors.borderDark : AppColors.borderLight,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
