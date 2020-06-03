import 'package:flutter/material.dart';
import 'package:mateus1430961721019/space_shooter_game.dart';

class GameWidget extends StatelessWidget {
  final Size size;

  GameWidget(this.size);

  @override
  Widget build(BuildContext context){
    final game = SpaceShooterGame(size);

    return GestureDetector(
      onPanStart: (_) {
        game.beginFire();
      },
      onPanEnd: (_) {
        game.stopFire();
      },
      onPanCancel: () {
        game.stopFire();
      },
      onPanUpdate: (DragUpdateDetails details) {
        game.onPlayerMove(details.delta);
      },
      child: Container(
          color: Color(0xFF0000000),
          child: game.widget),
    );
  }
}
