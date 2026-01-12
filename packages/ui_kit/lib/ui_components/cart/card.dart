import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ProductCard {
  final _cards = Cards();

  Widget card({
    required String title,
    String? subtitle,
    required String price,
    required Widget button,
  }) {
    return IntrinsicHeight(
      child: _cards.base(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: ui.typography.headlineMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (subtitle != null) ...[
                        Text(
                          subtitle,
                          style: ui.typography.captionSemibold.copyWith(
                            color: ui.colors.inputText,
                          ),
                        ),
                      ],
                      Text('$price ₽', style: ui.typography.title3Semibold),
                    ],
                  ),
                  const Spacer(),
                  button,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget noPrice({
    required String title,
    String? subtitle,
    required Widget button,
  }) {
    return _cards.base(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: ui.typography.headlineMedium),
          SizedBox(height: 36),
          Row(
            children: [
              if (subtitle != null) ...[
                Expanded(
                  child: Text(
                    subtitle,
                    style: ui.typography.captionSemibold.copyWith(
                      color: const Color(0xFF939396),
                    ),
                  ),
                ),
                const SizedBox(width: 90),
              ],
              if (subtitle == null) Spacer(),
              button,
            ],
          ),
        ],
      ),
    );
  }

  Widget cartItem({
    required String title,
    String? subtitle,
    required String price,
    required VoidCallback onRemove,
  }) {
    return _CartItemStatefulWidget(
      title: title,
      subtitle: subtitle,
      price: price,
      onRemove: onRemove,
    );
  }
}

class _CartItemStatefulWidget extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String price;
  final VoidCallback onRemove;

  const _CartItemStatefulWidget({
    required this.title,
    this.subtitle,
    required this.price,
    required this.onRemove,
  });

  @override
  State<_CartItemStatefulWidget> createState() => _CartItemStatefulWidgetState();
}

class _CartItemStatefulWidgetState extends State<_CartItemStatefulWidget> {
  int _count = 1;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 1) _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Cards().base(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // ← добавить эту строку
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: ui.typography.headlineMedium,
                  maxLines: 2,
                ),
              ),
              GestureDetector(
                onTap: widget.onRemove,
                child: ui.images.close(size: 20),
              ),
            ],
          ),
          if (widget.subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              widget.subtitle!,
              style: ui.typography.captionSemibold.copyWith(
                color: const Color(0xFF939396),
              ),
            ),
          ],

          const SizedBox(height: 20),

          Row(
            children: [
              Text(
                  '${widget.price} ₽',
                  style: ui.typography.title3Semibold
              ),

              const Spacer(),

              Text(
                '$_count штук',
                style: ui.typography.textRegular.copyWith(
                  color: ui.colors.inputText,
                ),
              ),

              const SizedBox(width: 42),

              _count == 1
                  ? ui.counter.active(
                onIncrement: _increment,
                onDecrement: _decrement,
              )
                  : ui.counter.disabled(
                onIncrement: _increment,
                onDecrement: _decrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}