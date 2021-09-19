import 'package:flutter/material.dart';
import 'package:ufrgs_mobile/models/ru.dart';
import 'package:ufrgs_mobile/utils/colors.dart';

class RuRow extends StatelessWidget {
  final RuMenu menu;

  const RuRow(this.menu, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardW = MediaQuery.of(context).size.width - (16 * 2);
    var cardapio = menu.getCardapio();
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: cardW,
            height: cardW * (300 / 1000),
            child: Stack(
              children: [
                Image.asset(
                  menu.getImageUri(),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      stops: [0.25, 0.5],
                      end: Alignment.topCenter,
                      colors: <Color>[Colors.black26, Colors.transparent],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Text(
                    menu.nome.trim(),
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              cardapio.isEmpty ? 'Restaurante fechado' : cardapio,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
