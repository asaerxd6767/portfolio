import 'package:flutter/material.dart';

class TypingAnimatedText extends StatefulWidget {
  const TypingAnimatedText({
    super.key,
    required this.texts,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 80),
    this.deletingSpeed = const Duration(milliseconds: 40),
    this.pauseDuration = const Duration(seconds: 2),
  });

  final List<String> texts;
  final TextStyle? style;
  final Duration typingSpeed;
  final Duration deletingSpeed;
  final Duration pauseDuration;

  @override
  State<TypingAnimatedText> createState() => _TypingAnimatedTextState();
}

class _TypingAnimatedTextState extends State<TypingAnimatedText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _cursorController;
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 530),
    )..repeat(reverse: true);

    _startTyping();
  }

  void _startTyping() {
    final text = widget.texts[_textIndex];

    if (!_isDeleting) {
      if (_charIndex < text.length) {
        Future.delayed(widget.typingSpeed, () {
          if (!mounted) return;
          setState(() {
            _charIndex++;
            _currentText = text.substring(0, _charIndex);
          });
          _startTyping();
        });
      } else {
        Future.delayed(widget.pauseDuration, () {
          if (!mounted) return;
          setState(() => _isDeleting = true);
          _startTyping();
        });
      }
    } else {
      if (_charIndex > 0) {
        Future.delayed(widget.deletingSpeed, () {
          if (!mounted) return;
          setState(() {
            _charIndex--;
            _currentText = text.substring(0, _charIndex);
          });
          _startTyping();
        });
      } else {
        _isDeleting = false;
        _textIndex = (_textIndex + 1) % widget.texts.length;
        _startTyping();
      }
    }
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_currentText, style: widget.style),
        FadeTransition(
          opacity: _cursorController,
          child: Text(
            '|',
            style: widget.style?.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
