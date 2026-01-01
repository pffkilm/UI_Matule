import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppImages {

  Image book({double? size, Color? color}) => _icon('book', size: size, color: color);
  Image close({double? size, Color? color}) => _icon('close', size: size, color: color);
  Image closeCirckle({double? size, Color? color}) => _icon('closeCirckle', size: size, color: color);
  Image closeSnackBar({double? size, Color? color}) => _icon('closeSnackBar', size: size, color: color);
  Image delete({double? size, Color? color}) => _icon('delete', size: size, color: color);
  Image down({double? size, Color? color}) => _icon('down', size: size, color: color);
  Image download({double? size, Color? color}) => _icon('download', size: size, color: color);
  Image eyes({double? size, Color? color}) => _icon('eyes', size: size, color: color);
  Image filter({double? size, Color? color}) => _icon('filter', size: size, color: color);
  Image hello({double? size, Color? color}) => _icon('hello', size: size, color: color);
  Image iconsForCart({double? size, Color? color}) => _icon('iconsForCart', size: size, color: color);
  Image left({double? size, Color? color}) => _icon('left', size: size, color: color);
  Image list({double? size, Color? color}) => _icon('list', size: size, color: color);
  Image message({double? size, Color? color}) => _icon('message', size: size, color: color);
  Image minus({double? size, Color? color}) => _icon('minus', size: size, color: color);
  Image plus({double? size, Color? color}) => _icon('plus', size: size, color: color);
  Image point({double? size, Color? color}) => _icon('point', size: size, color: color);
  Image screpka({double? size, Color? color}) => _icon('screpka', size: size, color: color);
  Image search({double? size, Color? color}) => _icon('search', size: size, color: color);
  Image shopp({double? size, Color? color}) => _icon('shopp', size: size, color: color);
  Image splash({double? size, Color? color}) => _icon('splash', size: size, color: color);
  Image tg({double? size, Color? color}) => _icon('tg', size: size, color: color);
  Image trueIcon({double? size, Color? color}) => _icon('true', size: size, color: color);
  Image voice({double? size, Color? color}) => _icon('voice', size: size, color: color);
  Image vk({double? size, Color? color}) => _icon('vk', size: size, color: color);
  Image yandex({double? size, Color? color}) => _icon('yandex', size: size, color: color);
  Image EyesC({double? size, Color? color}) => _icon('EyesC', size: size, color: color);

  Image profile({double? size, Color? color}) => _icon('profile', size: size, color: color);
  Image profileActiv({double? size, Color? color}) => _icon('profileActiv', size: size, color: color);
  Image katalog({double? size, Color? color}) => _icon('katalog', size: size, color: color);
  Image katalogActiv({double? size, Color? color}) => _icon('katalogActiv', size: size, color: color);
  Image home({double? size, Color? color}) => _icon('home', size: size, color: color);
  Image homeActiv({double? size, Color? color}) => _icon('homeActiv', size: size, color: color);
  Image project({double? size, Color? color}) => _icon('project', size: size, color: color);
  Image projectActiv({double? size, Color? color}) => _icon('projectActiv', size: size, color: color);


  Image _icon(String name, {double? size, Color? color}) {
    return Image.asset(
      'packages/ui_kit/assets/images/$name.png',
      width: size,
      height: size,
      color: color,
      package: MatuleKit.usePackageForImages ? 'ui_kit' : null, // ИСПОЛЬЗУЕМ ФЛАГ
    );
  }

}

