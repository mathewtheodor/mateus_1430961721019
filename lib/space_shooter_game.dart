import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:mateus1430961721019/game_object.dart';
import 'package:flame/time.dart';

class SpaceShooterGame extends Game {
  GameObject player;
  List<GameObject> enemies =[];
  Timer enemyCreator;
  static const enemy_speed = 400;


  SpaceShooterGame(){
    player = GameObject()
      ..position = Rect.fromLTWH(100, 100, 50, 50);

    enemyCreator = Timer(1.0,repeat:true,callback:() {
      enemies.add(
          GameObject()
            ..position = Rect.fromLTWH(0, 0, 50, 50)
      );
    });
    enemyCreator.start();
  }


  void onPlayerMove(Offset delta) {
    player.position = player.position.translate(delta.dx,delta.dy);
  }


  @override
  void update(double dt) {
    enemies.forEach((enemy) {
      enemy.position = enemy.position.translate(0, enemy_speed * dt);
    });

    enemyCreator.update(dt);
  }


  @override
  void render(Canvas canvas){
    player.render(canvas);

    enemies.forEach((enemy) {
      enemy.render(canvas);
    });
  }
}
