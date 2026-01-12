import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class BigButton {

  // Общий стиль для всех кнопок
  ButtonStyle _baseStyle() {
    return ElevatedButton.styleFrom(
      minimumSize: const Size(335, 56),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  // Основная кнопка
  Widget primary({
    required String text,
    VoidCallback? onPressed,
    bool enabled = true,
  }) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: _baseStyle().copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => enabled ? ui.colors.accent : ui.colors.accentInactive,
        ),
        foregroundColor: MaterialStateProperty.all(ui.colors.white),
      ),
      child: _buildText(text),
    );
  }

  // Кнопка удаления
  Widget delete({
    required String text,
    VoidCallback? onPressed,
    bool enabled = true,
  }) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: _baseStyle().copyWith(
        backgroundColor: MaterialStateProperty.all(ui.colors.white),
        foregroundColor: MaterialStateProperty.all(ui.colors.accent),
        side: MaterialStateProperty.all(
          BorderSide(color: ui.colors.accent),
        ),
      ),
      child: _buildText(text),
    );
  }

  // Неактивная кнопка
  Widget unActive({
    required String text,
    VoidCallback? onPressed,
    bool enabled = true,
  }) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: _baseStyle().copyWith(
        backgroundColor: MaterialStateProperty.all(ui.colors.inputBg),
        foregroundColor: MaterialStateProperty.all(ui.colors.black),
      ),
      child: _buildText(text),
    );
  }

  // Общий метод для создания текста
  Widget _buildText(String text) {
    return Text(
      text,
      style: ui.typography.captionSemibold,
    );
  }
}