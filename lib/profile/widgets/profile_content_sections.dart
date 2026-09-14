import 'package:flutter/material.dart';

import 'info_text.dart';
import 'profile_section.dart';
import 'skill_chip_wrap.dart';

class ProfileContentSections extends StatelessWidget {
  const ProfileContentSections({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.list(
        children: const [
          ProfileSection(
            title: 'Education',
            icon: Icons.school_outlined,
            children: [
              InfoText(
                'Bachelor of Computer Science and Artificial Intelligence\nMinia National University — Feb 2024 – Present',
              ),
              InfoText(
                'Relevant Coursework: Data Structures, Algorithms, OOP, Database Systems, Software Engineering, Artificial Intelligence\nExpected Graduation: 2028',
              ),
            ],
          ),
          ProfileSection(
            title: 'Experience',
            icon: Icons.work_outline,
            children: [
              InfoText(
                'ICPC MNU Community — Mentor (Oct 2025 – Present)\n• Mentored 30+ students in competitive programming and algorithmic problem solving.\n• Prepared training materials covering data structures, algorithms, and contest strategies.\n• Reviewed solutions and provided technical feedback.',
              ),
              InfoText(
                'Minia National University — Student Representative / Batch Leader (Oct 2025 – Present)\n• Represented 400+ students between faculty administration and students.\n• Managed communication, schedules, announcements, and academic services.\n• Organized Server Lab activities.',
              ),
            ],
          ),
          ProfileSection(
            title: 'Projects',
            icon: Icons.folder_outlined,
            children: [
              InfoText(
                'Kayan Brand — E-commerce App\nFlutter, Dart, Clean Architecture, REST APIs (2026)\n• Feature-rich e-commerce mobile app with responsive UI.\n• Clean Architecture with Singleton pattern for scalable code.\n• Seamless API integrations and real-time inventory sync.',
              ),
              InfoText(
                'AI Colorectal Cancer Assistant — RAG Pipeline\nPython, Next.js, Chroma, NLP (2026)\n• RAG pipeline for NICE clinical guidelines.\n• Structure-aware chunking with multilingual-e5-base embeddings.\n• Bilingual chat interface with private analysis dashboard.',
              ),
              InfoText(
                'Noor — Islamic Mobile App\nFlutter, Dart, Local Storage, Web Hosting (2026)\n• Prayer times, daily Azkar, and integrated Quran reader.\n• Persistent local storage with offline support.\n• Light/Dark modes, responsive design, Firebase hosting.',
              ),
              InfoText(
                'Nafi3 — Smart Donation Platform\nSystem Design, Web Development (2026)\n• Connects donors with verified charities through transparent tracking.\n• Smart matching based on location, urgency, and category.',
              ),
              InfoText(
                'Pharmacy Management System\nWeb Application, Database Systems (2026)\n• Digitized pharmacy operations with inventory, billing, and reporting.\n• Automated workflows and centralized data management.',
              ),
            ],
          ),
          ProfileSection(
            title: 'Technical Skills',
            icon: Icons.code,
            children: [
              SkillChipWrap(
                items: [
                  'C++',
                  'Python',
                  'C',
                  'SQL',
                  'Dart',
                  'JavaScript',
                  'Flutter',
                  'Firebase',
                  'HTML',
                  'CSS',
                  'Git',
                  'GitHub',
                  'VS Code',
                  'Figma',
                  'OOP',
                  'Data Structures',
                  'Algorithms',
                  'AI',
                ],
              ),
            ],
          ),
          ProfileSection(
            title: 'Achievements',
            icon: Icons.emoji_events_outlined,
            children: [
              InfoText(
                '• Solved 650+ problems on Codeforces.\n• Codeforces Rating: Pupil.\n• Participated in ECPC and ACPC contests.\n• 1st Place among 35 students in the Computer Science Department.',
              ),
            ],
          ),
          ProfileSection(
            title: 'Languages',
            icon: Icons.language_outlined,
            children: [
              InfoText(
                '• Arabic — Native\n• English — Very Good',
              ),
            ],
          ),
          ProfileSection(
            title: 'Contact',
            icon: Icons.alternate_email,
            children: [
              InfoText(
                'mohammedasser070@gmail.com\nMinya, Egypt\nLinkedIn: linkedin.com/in/asser-mohammed\nGitHub: github.com/asaerxd6767\nCodeforces: codeforces.com/profile/asser_mohammed',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
