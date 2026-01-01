import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class Input extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? value;
  final bool isPassword;
  final bool showEyeIcon;
  final Function(String)? onChanged;
  final bool showValidationBorder;
  final bool hasError;
  final String? helperText;

  const Input({
    super.key,
    this.label,
    this.hint,
    this.value = '',
    this.isPassword = false,
    this.showEyeIcon = true,
    this.onChanged,
    this.showValidationBorder = false,
    this.hasError = false,
    this.helperText,
  });

  @override
  State<Input> createState() => _SimpleInputState();
}

class _SimpleInputState extends State<Input> {
  late TextEditingController _controller;
  bool _showPassword = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Лейбл
        if (widget.label != null)
          Text(
            widget.label!,
            style: ui.typography.captionSemibold.copyWith(
              color: ui.colors.description,
            ),
          ),
        const SizedBox(height: 8),

        // Поле ввода
        SizedBox(
          width: 335,
          height: 48,
          child: FocusScope(
            child: Focus(
              onFocusChange: (hasFocus) {
                setState(() => _isFocused = hasFocus);
              },
              child: TextFormField(
                controller: _controller,
                obscureText: widget.isPassword && !_showPassword,
                obscuringCharacter: '*',
                cursorColor:
                widget.hasError ? ui.colors.error : ui.colors.accent,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: ui.typography.textRegular.copyWith(
                    color: ui.colors.description,
                  ),
                  // Заливка
                  filled: true,
                  fillColor: widget.hasError
                      ? Color(0x1AFD3535)
                      : ui.colors.input,

                  // Иконка глаза для пароля
                  suffixIcon: widget.isPassword && widget.showEyeIcon
                      ? IconButton(
                    icon: _showPassword
                        ? ui.images.eyes(size: 20)
                        : ui.images.EyesC(size: 20),
                    onPressed: () {
                      setState(() => _showPassword = !_showPassword);
                    },
                  )
                      : null,

                  // Границы
                  border: _buildBorder(_getBorderColor(), 1),
                  focusedBorder: _buildBorder(
                      widget.hasError
                          ? ui.colors.error
                          : ui.colors.accent.withOpacity(0.5),
                      2),
                  enabledBorder: _buildBorder(_getBorderColor(), 1),
                ),
                onChanged: (text) {
                  widget.onChanged?.call(text);
                },
              ),
            ),
          ),
        ),

        // Helper текст
        if (widget.helperText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.helperText!,
            style: TextStyle(
              fontSize: 12,
              color:
              widget.hasError ? ui.colors.error : ui.colors.inputBackground,
            ),
          ),
        ],
      ],
    );
  }

  OutlineInputBorder _buildBorder(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  Color _getBorderColor() {
    if (_isFocused) {
      return widget.hasError ? ui.colors.error : ui.colors.accent;
    }

    if (widget.hasError) {
      return ui.colors.error;
    }

    if (widget.showValidationBorder && _controller.text.isNotEmpty) {
      return ui.colors.inputBackground;
    }

    return ui.colors.inputStroke2 ;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}