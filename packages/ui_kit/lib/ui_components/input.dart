import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class Input extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? value;
  final bool isPassword;
  final bool showEyeIcon; //не понятно как используется
  final Function(String)? onChanged;//не понятно зачем он
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
  late TextEditingController _controller; // это тоже не понятно без него можнго ли вообще
  bool _showPassword = false; // тогда зачем isPassword
  bool _isFocused = false; // тогда зачем showValidationBorder

  @override
  void initState() { // этио тоже вообще не опнятно для чего
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
        if (widget.label != null) // что мы здесь солздали виджет что ли
          // я так поняла виджет потому что stateful что ли или не из за этого иил мы виджет создали не понимаю
          Text(
            widget.label!, // зачем тут нужен ! не понятно
            style: ui.typography.captionSemibold.copyWith(
              color: ui.colors.description,
            ),
          ),
        const SizedBox(height: 8),

        // Поле ввода
        SizedBox(
          width: 335,
          height: 48,
          child: FocusScope( // это специальный виджет что ли для фокуса расскади по болше о нем чтобы было понятно
            child: Focus(
              onFocusChange: (hasFocus) { // не понятно что мы тут делаем для чего он нуцжен
                setState(() => _isFocused = hasFocus);
              },
              child: TextFormField(
                controller: _controller, //зачем он нужен и как это работает можно ли без него
                obscureText: widget.isPassword && !_showPassword, //какое то не понятное условие и что это за свойство что оно дает
                obscuringCharacter: '*',
                cursorColor:
                widget.hasError ? ui.colors.error : ui.colors.accent,
                decoration: InputDecoration( //что это за свойтсо не опнимаю зачем оно нужено
                  hintText: widget.hint, // это свойстов жиректион что ли
                  hintStyle: ui.typography.textRegular.copyWith( // такое есть что ли свойство я не знала
                    color: ui.colors.description,
                  ),
                  // Заливка
                  filled: true, // а это зачем сразу нельзя что ли
                  fillColor: widget.hasError
                      ? Color(0x1AFD3535)
                      : ui.colors.input,

                  // Иконка глаза для пароля
                  suffixIcon: widget.isPassword && widget.showEyeIcon //вот я об этом то есть можрно было просто как за 1 переменую что ли взять или он работвет на случаф когда ты не хочешь иконку глазика
                      ? IconButton(//почему icon а не images
                    icon: _showPassword //почему не show icon странно очень правда
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
                  widget.onChanged?.call(text); //ВАЩЕ БЕЗ ПОНЯТИЯ КАК ЭТО РАБОТАЕТ
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

  OutlineInputBorder _buildBorder(Color color, double width) { // это тоже вообще не понятно
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  Color _getBorderColor() { // не понятные условия что эьто вообще такое
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