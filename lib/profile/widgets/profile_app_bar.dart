import 'package:flutter/material.dart';

import 'profile_header.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.backgroundImage,
    required this.profileImage,
  });

  final String backgroundImage;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 940,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Colors.white,
      title: const Text('Asser Mohammed', style: TextStyle(fontWeight: FontWeight.w700)),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
        ],
        background: ProfileHeader(
          backgroundImage: backgroundImage,
          profileImage: profileImage,
        ),
      ),
    );
  }
}
