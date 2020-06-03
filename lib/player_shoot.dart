import 'package:flutter/material.dart';
import 'package:mateus1430961721019/game_object.dart';

class PlayerShoot extends CollidableObject {

  PlayerShoot(Size screenSize, Rect gun) {
    double width = screenSize.width / 16;
    double height = screenSize.height / 10;
    double xPos = (gun.left + gun.right) / 2;
    double yPos = gun.top - height;

    this.position = Rect.fromLTWH(xPos, yPos, width, height);
    this.speed = -400;
    this.paint = Paint()
      ..color = GameObject.green;
  }
}