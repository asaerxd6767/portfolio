import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLink extends StatelessWidget {
  const ContactLink({
    super.key,
    required this.label,
    required this.url,
    this.icon,
  });

  final String label;
  final String url;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: TextButton.icon(
        onPressed: () => launchUrl(Uri.parse(url)),
        icon: Icon(icon, size: 18, color: colorScheme.primary),
        label: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
