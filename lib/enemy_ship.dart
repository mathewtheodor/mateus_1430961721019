import 'package:flame/animation.dart' as FlameAnim;
import 'package:flutter/material.dart';
import 'package:mateus1430961721019/game_object.dart';

class EnemyShip extends CollidableObject {

  EnemyShip(Size screenSize, double xRand) {
    spritePath = "enemy.png";
    scale = 4;
    hp = 3;

    double width = (16 / 360) * screenSize.width;
    double height = (16 / 640) * screenSize.height;
    double xPos = (screenSize.width - width) * xRand;
    double yPos = 0;

    this.position = Rect.fromLTWH(xPos, yPos, width * scale, height * scale);
    this.animation = FlameAnim.Animation.sequenced(spritePath, 4, textureWidth: width, textureHeight: height);
    this.speed = 800;
    this.paint = Paint()
      ..color = GameObject.red;
  }
}