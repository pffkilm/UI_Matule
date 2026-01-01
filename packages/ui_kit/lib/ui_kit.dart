
library ui_kit;

import 'package:flutter/material.dart';
import 'package:ui_kit/colors.dart';
import 'package:ui_kit/typography.dart';
import 'package:ui_kit/images.dart';
import 'package:ui_kit/ui_components/BottomNavigation.dart';
import 'package:ui_kit/ui_components/Menu.dart';
import 'package:ui_kit/ui_components/button/BigButton.dart';
import 'package:ui_kit/ui_components/button/ChipButton.dart';
import 'package:ui_kit/ui_components/button/SmallButton.dart';
import 'package:ui_kit/ui_components/cart/CardBackground.dart';
import 'package:ui_kit/ui_components/cart/card.dart';
import 'package:ui_kit/ui_components/controllers/Toggle.dart';
import 'package:ui_kit/ui_components/controllers/counter.dart';
import 'package:ui_kit/ui_components/input.dart';
import 'package:ui_kit/ui_components/login.dart';
import 'package:ui_kit/ui_components/search.dart';


export 'ui_components/cart/CardBackground.dart';
export 'colors.dart';
export 'typography.dart';
export 'images.dart';
export 'ui_components/button/BigButton.dart';
export 'ui_components/button/ChipButton.dart';
export 'ui_components/button/SmallButton.dart';
export 'ui_components/input.dart';
export 'ui_components/login.dart';
export 'ui_components/controllers/Toggle.dart';
export 'ui_components/cart/card.dart';
export 'ui_components/search.dart';


class MatuleKit {
  static bool usePackageForImages = false;
  static final MatuleKit _instance = MatuleKit._internal();
  factory MatuleKit() => _instance;
  MatuleKit._internal();

  AppColors get colors => AppColors();
  AppTypography get typography => AppTypography();
  AppImages get images => AppImages();
  BigButton get bigButton => BigButton();
  ChipButton get chipButton => ChipButton();
  SmallButton get smallButton => SmallButton();
  Input get input => Input();
  LogoButtons get logo => LogoButtons();
  BottomNavigationHelper get bottomNavigation => BottomNavigationHelper();
  Counter get counter => Counter();
  Menu get menu =>  Menu(text: '',);
  Toggle get toggle =>  Toggle ();
  Cards get base => Cards();
  ProductCard get productCard => ProductCard();
  SimpleSearchBar get search => SimpleSearchBar();
}

final ui = MatuleKit();