import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../core/responsive/responsive_builder.dart';
import '../../core/layout/sidebar.dart';

class PortfolioNavScope extends InheritedWidget {
  const PortfolioNavScope({
    super.key,
    required this.scrollToLabel,
    required super.child,
  });

  final void Function(String label) scrollToLabel;

  static PortfolioNavScope? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PortfolioNavScope>();

  @override
  bool updateShouldNotify(PortfolioNavScope oldWidget) =>
      scrollToLabel != oldWidget.scrollToLabel;
}

class PortfolioLayout extends StatefulWidget {
  const PortfolioLayout({
    super.key,
    required this.sections,
    required this.sectionBuilders,
  });

  final List<SidebarSection> sections;
  final List<Widget Function(BuildContext, int)> sectionBuilders;

  @override
  State<PortfolioLayout> createState() => _PortfolioLayoutState();
}

class _PortfolioLayoutState extends State<PortfolioLayout> {
  late final ScrollController _scrollController;
  int _activeSection = 0;
  final List<GlobalKey> _sectionKeys = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _sectionKeys.addAll(
      List.generate(widget.sections.length, (_) => GlobalKey()),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    for (int i = _sectionKeys.length - 1; i >= 0; i--) {
      final key = _sectionKeys[i];
      if (key.currentContext != null) {
        final box = key.currentContext!.findRenderObject() as RenderBox?;
        if (box != null) {
          final offset = box.localToGlobal(Offset.zero, ancestor: null);
          if (offset.dy <= 150) {
            if (_activeSection != i) {
              setState(() => _activeSection = i);
            }
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.1,
      );
    }
    setState(() => _activeSection = index);
  }

  void _scrollToLabel(String label) {
    final index = widget.sections.indexWhere((s) => s.label == label);
    if (index >= 0) _scrollToSection(index);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _buildMobile(),
      tablet: _buildTablet(),
      desktop: _buildDesktop(),
    );
  }

  Widget _buildDesktop() {
    return Row(
      children: [
        Sidebar(
          sections: widget.sections,
          activeSection: _activeSection,
          onSectionTap: _scrollToSection,
        ),
        Expanded(child: _buildContent()),
      ],
    );
  }

  Widget _buildTablet() {
    return Column(
      children: [
        _buildMobileNav(),
        Expanded(child: _buildContent()),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        _buildMobileNav(),
        Expanded(child: _buildContent()),
      ],
    );
  }

  Widget _buildMobileNav() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111827) : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: isDark ? const Color(0xFF1F2937) : const Color(0xFFE5E7EB),
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.sections.length,
        itemBuilder: (context, index) {
          final section = widget.sections[index];
          final isActive = index == _activeSection;

          return GestureDetector(
            onTap: () => _scrollToSection(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    section.icon,
                    size: 20,
                    color: isActive
                        ? const Color(0xFF4F46E5)
                        : (isDark
                              ? const Color(0xFF9CA3AF)
                              : const Color(0xFF6B7280)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    section.label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      color: isActive
                          ? const Color(0xFF4F46E5)
                          : (isDark
                                ? const Color(0xFF9CA3AF)
                                : const Color(0xFF6B7280)),
                    ),
                  ),
                  if (isActive) ...[
                    const SizedBox(height: 2),
                    Container(
                      width: 20,
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4F46E5),
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark ? const Color(0xFF030712) : const Color(0xFFF9FAFB),
      child: PortfolioNavScope(
        scrollToLabel: _scrollToLabel,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.trackpad,
            },
          ),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            itemCount: widget.sectionBuilders.length,
            itemBuilder: (context, index) {
              return Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      key: _sectionKeys[index],
                      child: widget.sectionBuilders[index](context, index),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
