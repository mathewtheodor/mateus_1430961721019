import 'package:flutter/material.dart';
import 'package:mateus1430961721019/space_game_shooter.dart';

class GameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final game = SpaceShooterGame();
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        game.onPlayerMove(details.delta);
      },
      child: Container(
          color: Color(0xFF0000000),
          child: game.widget),
    );
  }
}

class GameObject {
  Rect position;
  Paint _white = Paint()
    ..color = Color(0xFFFFFFFF);

  void render(Canvas canvas) {
    canvas.drawRect(position, _white);
  }
}