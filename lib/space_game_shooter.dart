import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:mateus1430961721019/game_object.dart';

class SpaceShooterGame extends Game {
  GameObject player;
  SpaceShooterGame(){
    player = GameObject()
      ..position = Rect.fromLTWH(100, 100, 50, 50);
  }
  void onPlayerMove(Offset delta) {
    player.position = player.position.translate(delta.dx,delta.dy);
  }
  @override
  void update(double dt) {
  }
  @override
  void render(Canvas canvas){
    player.render(canvas);
  }
}
