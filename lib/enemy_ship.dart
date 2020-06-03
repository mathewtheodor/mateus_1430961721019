import 'package:flutter/material.dart';
import 'package:mateus1430961721019/game_object.dart';

class EnemyShip extends CollidableObject {

  EnemyShip(Size screenSize, double xRand) {
    double width = screenSize.width / 5;
    double height = width;
    double xPos = (screenSize.width - width) * xRand;
    double yPos = 0;

    this.position = Rect.fromLTWH(xPos, yPos, width, height);
    this.speed = 400;
    this.paint = Paint()
      ..color = GameObject.red;
  }
}