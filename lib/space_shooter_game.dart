import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/time.dart';
import 'package:mateus1430961721019/enemy_ship.dart';
import 'package:mateus1430961721019/game_object.dart';
import 'package:mateus1430961721019/player_ship.dart';
import 'package:mateus1430961721019/player_shoot.dart';


class SpaceShooterGame extends Game {
  final Size screenSize;
  Random random = new Random();

  CollidableObject player;

  List<CollidableObject> collidables = CollidableObject.collidableObjects;
  List<CollidableObject> enemies =[];
  List<CollidableObject> shoots =[];

  Timer enemyCreator;
  Timer shootCreator;


  SpaceShooterGame(this.screenSize){
    player = new PlayerShip(screenSize);

    double spawnTime = random.nextDouble();
    enemyCreator = Timer(spawnTime, repeat:true, callback:() {
      double spawnPosX = random.nextDouble();
      double spd = random.nextDouble();
      enemies.add(
          EnemyShip(screenSize, spawnPosX)
              ..speed *= spd
      );
    });

    shootCreator = Timer(0.2, repeat:true, callback:() {
      Rect spawnPos = player.position;
      shoots.add(
          PlayerShoot(screenSize, spawnPos)
      );
    });

    enemyCreator.start();
  }


  void onPlayerMove(Offset delta) {
    player.position = player.position.translate(delta.dx,delta.dy);
  }

  void beginFire() {
    shootCreator.start();
  }

  void stopFire() {
    shootCreator.stop();
  }


  @override
  void update(double dt) {
    player.update(dt);

    enemyCreator.update(dt);
    shootCreator.update(dt);

    enemies.forEach((enemy) {
      enemy.update(dt);
      enemy.position = enemy.position.translate(0, enemy.speed * dt);
    });

    shoots.forEach((shoot) {
      shoot.update(dt);
      shoot.position = shoot.position.translate(0, shoot.speed * dt);

      enemies.forEach((enemy){
        if (shoot.position.overlaps(enemy.position)) {
          shoot.collidingObjects.add(enemy);
          enemy.hp -= 1;
        }
      });
    });

    enemies.removeWhere ((enemy) => enemy.position.top >= screenSize.height ||
                          enemy.hp <= 0);
    shoots.removeWhere ((shoot) => shoot.position.bottom <= 0 ||
                         shoot.collidingObjects.isNotEmpty);
  }


  @override
  void render(Canvas canvas){
    player.render(canvas);

    enemies.forEach((enemy) {
      enemy.render(canvas);
    });

    shoots.forEach((shoot) {
      shoot.render(canvas);
    });
  }
}
