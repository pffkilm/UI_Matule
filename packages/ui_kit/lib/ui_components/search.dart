import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class SimpleSearchBar extends StatefulWidget {
  const SimpleSearchBar({super.key});

  @override
  State<SimpleSearchBar> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SimpleSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showClose = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showClose = _controller.text.isNotEmpty;
      });
    });
    _focusNode.addListener(() {
      setState(() {
        _showClose = _controller.text.isNotEmpty || _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFEBEBEB),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.only(left: 14, right: 19),
      child: Row(
        children: [
          ui.images.search(size: 20, color: Color(0xFF7E7E9A)),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              cursorColor: ui.colors.accent,
              decoration: InputDecoration(
                hintText: 'Искать описание',
                hintStyle: ui.typography.headlineRegular.copyWith(
                  color: Color(0xFF939396),
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          if (_showClose)
            GestureDetector(
              onTap: () {
                _controller.clear();
                _focusNode.requestFocus();
              },
              child: ui.images.close(size: 20, color: Color(0xFF7E7E9A)),
            ),
        ],
      ),
    );
  }
}