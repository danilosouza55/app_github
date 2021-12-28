import 'package:flutter/material.dart';

class BotaoWidget extends StatelessWidget {
  final EdgeInsets padding;
  final Function funcao;
  final MaterialStateProperty<Color> corFundo;
  final MaterialStateProperty<Color> overlay;
  final Color corBorda;
  final String titulo;
  final Color corTexto;
  final double height;
  final double width;

  const BotaoWidget({
    Key? key,
    required this.funcao,
    required this.corFundo,
    required this.corBorda,
    required this.titulo,
    required this.corTexto,
    required this.overlay,
    this.padding = const EdgeInsets.only(top: 5.0),
    this.height = 65,
    this.width = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      child: ElevatedButton(
        onPressed: () {
          funcao();
        },
        style: ButtonStyle(
          backgroundColor: corFundo,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: corBorda),
            ),
          ),
          overlayColor: overlay,
        ),
        child: Text(
          titulo,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: corTexto,
          ),
        ),
      ),
    );
  }
}
