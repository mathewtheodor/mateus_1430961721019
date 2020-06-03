import 'package:flutter/material.dart';
import 'package:mateus1430961721019/game_object.dart';

class PlayerShip extends CollidableObject {

  PlayerShip(Size screenSize) {
    double width = screenSize.width / 10;
    double height = screenSize.height / 10;
    double xPos = screenSize.width / 2;
    double yPos = screenSize.height - height;

    this.position = Rect.fromLTWH(xPos, yPos, width, height);
    this.paint = Paint()
      ..color = GameObject.white;
  }

}