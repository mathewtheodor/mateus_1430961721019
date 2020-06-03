import 'package:flutter/material.dart';

abstract class GameObject {
  Rect position;
  Paint paint;
  double speed;
  static Color red = Colors.red;
  static Color white = Colors.white;
  static Color green = Colors.green;

  void render(Canvas canvas) {
    canvas.drawRect(position, paint);
  }
}

abstract class CollidableObject extends GameObject {
  static List<CollidableObject> collidableObjects = [];
  List<CollidableObject> collidingObjects = [];

  CollidableObject() {
    collidableObjects.add(this);
  }
}