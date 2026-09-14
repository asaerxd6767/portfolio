import 'package:flutter/material.dart';

import '../widgets/profile_app_bar.dart';
import '../widgets/profile_content_sections.dart';
import '../widgets/profile_intro.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String _profileImage = 'assets/images/Asser2.jpg';
  static const String _profileBackground =
      'assets/images/Profile_Background01.png';

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        ProfileAppBar(
          backgroundImage: _profileBackground,
          profileImage: _profileImage,
        ),
        ProfileIntro(),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        ProfileContentSections(),
        SliverToBoxAdapter(child: SizedBox(height: 28)),
      ],
    );
  }
}
