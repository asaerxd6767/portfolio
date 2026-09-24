import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/animations/fade_in_wrapper.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/responsive/responsive_builder.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
              title: 'Featured Projects',
              subtitle: 'A selection of my recent work',
            ),
            const SizedBox(height: 24),
            _ProjectCard(
              title: 'Kayan Brand',
              subtitle: 'E-commerce Mobile App',
              description:
                  'A feature-rich e-commerce mobile app with responsive UI, clean architecture with singleton pattern, seamless API integrations, and real-time inventory sync.',
              tags: ['Flutter', 'Dart', 'REST APIs', 'Clean Architecture'],
              image: null,
              githubUrl: 'https://github.com/asaerxd6767/Kayan_Brand',
              accentColor: const Color(0xFF10B981),
            ),
            const SizedBox(height: 20),
            _ProjectCard(
              title: 'Leo Clinic',
              subtitle: 'Healthcare Management App',
              description:
                  'Full-featured clinic management app with real backend API integration, doctor/patient dashboards, appointment scheduling, and authentication with server tokens.',
              tags: [
                'Flutter',
                'Clean Architecture',
                'API Integration',
                'Team Lead',
              ],
              image: 'assets/images/Tech_Mastery_Internship.jpg',
              githubUrl:
                  'https://github.com/techmasterycompany-star/LeoClinic_flutter',
              accentColor: const Color(0xFF06B6D4),
            ),
            const SizedBox(height: 20),
            _ProjectCard(
              title: 'AI Colorectal Cancer Assistant',
              subtitle: 'RAG Pipeline',
              description:
                  'RAG pipeline for NICE clinical guidelines with structure-aware chunking, multilingual-e5-base embeddings, and a bilingual chat interface with private analysis dashboard.',
              tags: ['Python', 'Next.js', 'Chroma', 'NLP'],
              image: 'assets/images/Ai_Hackathon(RAG).jpg',
              liveUrl: 'https://ai-project-for-hackathon.vercel.app/',
              accentColor: const Color(0xFFEF4444),
            ),
            const SizedBox(height: 20),
            _ProjectCard(
              title: 'Nafi3',
              subtitle: 'Smart Donation Platform',
              description:
                  'Connects donors with verified charities through transparent tracking. Smart matching based on location, urgency, and category. Built at Tech Mastery hackathon.',
              tags: ['System Design', 'Web Dev', 'Hackathon'],
              image: 'assets/images/Tech_Mastery_Hackathon(Nafi3).jpg',
              accentColor: const Color(0xFFEC4899),
            ),
            const SizedBox(height: 20),
            _ProjectCard(
              title: 'AlgoViz',
              subtitle: 'Algorithm Visualizer',
              description:
                  'Interactive Flutter app visualizing sorting algorithms and pathfinding with custom Canvas rendering, real-time animations, and a cyber-circuit design system.',
              tags: ['Flutter', 'BLoC', 'CustomPainter', 'Streams'],
              image: null,
              githubUrl: 'https://github.com/asaerxd6767/AlgoViz',
              accentColor: const Color(0xFFF59E0B),
            ),
            const SizedBox(height: 20),
            _ProjectCard(
              title: 'Noor',
              subtitle: 'Islamic Mobile App',
              description:
                  'Prayer times, daily Azkar, and integrated Quran reader with persistent local storage, offline support, light/dark modes, and Firebase hosting.',
              tags: ['Flutter', 'Local Storage', 'Firebase', 'Responsive'],
              image: null,
              liveUrl: 'https://final-project-84d31.web.app/#/setup',
              accentColor: const Color(0xFF059669),
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

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    this.image,
    this.githubUrl,
    this.liveUrl,
    this.accentColor = AppColors.accent,
  });

  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final String? image;
  final String? githubUrl;
  final String? liveUrl;
  final Color accentColor;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Breakpoints.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.translationValues(0, -4, 0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : AppColors.cardLight,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? widget.accentColor.withValues(alpha: 0.5)
                : (isDark ? AppColors.borderDark : AppColors.borderLight),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withValues(alpha: 0.1),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: isMobile
            ? _buildMobileLayout(theme, isDark)
            : _buildDesktopLayout(theme, isDark),
      ),
    );
  }

  Widget _buildDesktopLayout(ThemeData theme, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildContent(theme, isDark)),
        if (widget.image != null)
          Expanded(flex: 4, child: _buildImagePreview(isDark)),
      ],
    );
  }

  Widget _buildMobileLayout(ThemeData theme, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.image != null) _buildImagePreview(isDark),
        _buildContent(theme, isDark),
      ],
    );
  }

  Widget _buildContent(ThemeData theme, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: widget.accentColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: widget.accentColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
                  color: widget.accentColor.withValues(
                    alpha: isDark ? 0.15 : 0.08,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: widget.accentColor,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              if (widget.githubUrl != null)
                _ProjectLink(
                  label: 'View Code',
                  icon: Icons.code,
                  url: widget.githubUrl!,
                ),
              if (widget.githubUrl != null && widget.liveUrl != null)
                const SizedBox(width: 16),
              if (widget.liveUrl != null)
                _ProjectLink(
                  label: 'Live Demo',
                  icon: Icons.open_in_new,
                  url: widget.liveUrl!,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview(bool isDark) {
    return Container(
      width: double.infinity,
      height: 260,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          widget.image!,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return SizedBox.expand(
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 48,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProjectLink extends StatelessWidget {
  const _ProjectLink({
    required this.label,
    required this.icon,
    required this.url,
  });

  final String label;
  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.accent),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}
