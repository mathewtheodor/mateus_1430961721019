import 'package:flame/animation.dart'as FlameAnim;
import 'package:flutter/material.dart';
import 'package:mateus1430961721019/game_object.dart';

class PlayerShip extends CollidableObject {

  PlayerShip(Size screenSize) {
    spritePath = "player.png";
    scale = 2;

    double width = (32 / 360) * screenSize.width;
    double height = (48 / 640) * screenSize.height;
    double xPos = screenSize.width / 2;
    double yPos = screenSize.height - height;

    this.position = Rect.fromLTWH(xPos, yPos, width * scale, height * scale);
    this.animation = FlameAnim.Animation.sequenced(spritePath, 4, textureWidth: width, textureHeight: height);
    this.paint = Paint()
      ..color = GameObject.white;
  }

}