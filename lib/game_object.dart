import 'package:flame/animation.dart' as FlameAnim;
import 'package:flutter/material.dart';

abstract class GameObject {
  Rect position;
  double scale;
  Paint paint;

  String spritePath;
  FlameAnim.Animation animation;

  double speed;
  static Color red = Colors.red;
  static Color white = Colors.white;
  static Color green = Colors.green;

  void render(Canvas canvas) {
    if (animation != null && animation.loaded())  {
      animation.getSprite().renderRect(canvas, position);
    } else {
      canvas.drawRect(position, paint);
    }
  }

  void update (double dt) {
    animation.update(dt);
  }
}

abstract class CollidableObject extends GameObject {
  static List<CollidableObject> collidableObjects = [];
  List<CollidableObject> collidingObjects = [];
  int hp;

  CollidableObject() {
    collidableObjects.add(this);
  }
}