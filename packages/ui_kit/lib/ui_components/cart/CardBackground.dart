// lib/src/components/card/null.dart
import 'package:flutter/material.dart';

class Cards {

  Widget base({Widget? child, double? height}) {
    return Container(
      width: 335,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.fromBorderSide(
          BorderSide(color: Color(0xFFF4F4F4), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x99E4E8F5),
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}