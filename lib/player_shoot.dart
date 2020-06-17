import 'package:flame/animation.dart'as FlameAnim;
import 'package:flutter/material.dart';
import 'package:mateus1430961721019/game_object.dart';

class PlayerShoot extends CollidableObject {

  PlayerShoot(Size screenSize, Rect gun) {
    spritePath = "bullet.png";
    scale = 1;

    double width = (8 / 360) * screenSize.width;
    double height = (16 / 640) * screenSize.height;
    double xPos = (gun.left + gun.right) / 2;
    double yPos = gun.top - height;

    this.position = Rect.fromLTWH(xPos, yPos, width * scale, height * scale);
    this.animation = FlameAnim.Animation.sequenced(spritePath, 4, textureWidth: width, textureHeight: height);
    this.speed = -400;
    this.paint = Paint()
      ..color = GameObject.green;
  }
}