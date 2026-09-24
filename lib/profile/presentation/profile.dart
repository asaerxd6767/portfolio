import 'package:flutter/material.dart';

import '../../core/layout/portfolio_layout.dart';
import '../../core/layout/sidebar.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/stats_section.dart';
import '../widgets/sections/what_i_do_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/tech_stack_section.dart';
import '../widgets/sections/contact_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _sections = [
    SidebarSection(icon: Icons.home_outlined, label: 'Home'),
    SidebarSection(icon: Icons.person_outline, label: 'About'),
    SidebarSection(icon: Icons.star_outline, label: 'What I Do'),
    SidebarSection(icon: Icons.rocket_launch_outlined, label: 'Projects'),
    SidebarSection(icon: Icons.work_outline, label: 'Experience'),
    SidebarSection(icon: Icons.code, label: 'Tech Stack'),
    SidebarSection(icon: Icons.mail_outline, label: 'Contact'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PortfolioLayout(
        sections: _sections,
        sectionBuilders: const [
          _buildHero,
          _buildStats,
          _buildWhatIDo,
          _buildProjects,
          _buildExperience,
          _buildTechStack,
          _buildContact,
        ],
      ),
    );
  }

  static Widget _buildHero(BuildContext context, int index) =>
      const HeroSection();

  static Widget _buildStats(BuildContext context, int index) =>
      const StatsSection();

  static Widget _buildWhatIDo(BuildContext context, int index) =>
      const WhatIDoSection();

  static Widget _buildProjects(BuildContext context, int index) =>
      const ProjectsSection();

  static Widget _buildExperience(BuildContext context, int index) =>
      const ExperienceSection();

  static Widget _buildTechStack(BuildContext context, int index) =>
      const TechStackSection();

  static Widget _buildContact(BuildContext context, int index) =>
      const ContactSection();
}
