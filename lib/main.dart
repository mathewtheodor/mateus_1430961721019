import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:mateus1430961721019/game_widget.dart';


void main() async {
  Size size = await Flame.util.initialDimensions();
  runApp(GameWidget(size));
}

