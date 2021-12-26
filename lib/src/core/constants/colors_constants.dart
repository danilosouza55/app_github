import 'dart:ui';
import 'package:flutter/material.dart';

class ColorsConstants {
  //Cores Stone
  static Color stone = const Color(0xFF008B57);
  static Color stoneOverlay = const Color(0xFF00AB63);
  static Color stoneLigth = const Color(0xFFE0FFF1);

  //Cores SetaERP
  static Color orangeSeta = const Color(0xFFEB5D40);
  static Color orangeSetaOverlay = const Color(0xFFEB6A50);
  static Color orangeSetaLigth = const Color(0xFFF6D6D4);

  //Cores Outros
  static Color red = Colors.red;
  static Color white = Colors.white;

  //Cores Linx
  static Color orangeLinx = const Color(0xfff0462d);
  static Color yellowLinx = const Color(0xffffb914);
  static Color purpleLinx = const Color(0xFF280a3c);

  //Cores Ativas Seta
  static Color corPrincipal = purpleLinx;
  static Color corSegundaria = orangeSetaOverlay;
  static Color corLigth = orangeSetaLigth;
  // static Color corPrincipal = stone;
  // static Color corSegundaria = stoneOverlay;
  // static Color corLigth = stoneLigth;

  //Fundo do aplicativo
  static Color backgroundPrincipal = corPrincipal;
  static Color background = const Color(0xFFF3F7FC);
  static Color backgroundLight = white;

  //Theme
  static Color canvasColor = white;
  static MaterialColor primarySwatch = MaterialColor(
    0xfff0462d,
    <int, Color>{
      50: corPrincipal, //10%
      100: corPrincipal, //20%
      200: corPrincipal, //30%
      300: corPrincipal, //40%
      400: corPrincipal, //50%
      500: corPrincipal, //60%
      600: corPrincipal, //70%
      700: corPrincipal, //80%
      800: corPrincipal, //90%
      900: corPrincipal, //100%
    },
  );

  //Text
  static Color textOnPress = const Color.fromARGB(150, 255, 255, 255);
  static Color textYellow = const Color(0xffffb914);
  static Color textBlack = Colors.black;
  static Color textLight = white;
  static Color textPrincipal = corPrincipal;
  static Color textApagado = const Color(0xFF575757);
  static Color textError = red;
  static Color textSubTitle = const Color(0xFF6E7E90);
  static Color textPagamento = purpleLinx;
  static Color textTransferencia = orangeSeta;

  //Icon
  static Color iconApagado = const Color(0xFF677481);
  static Color iconBlack = Colors.black;
  static Color iconError = red;
  static Color iconPrincipal = corPrincipal;

  //Saldo
  static Color saldo = const Color(0xFFEAF0F8);

  //borda
  static Color bordaPrincipal = corPrincipal;
  static Color bordaBlack = Colors.black;
  static Color bordaPrincipalLight = corLigth;
  static Color bordaAlerta = const Color(0xFFFFCE5B);
  static Color bordaError = red;
  static Color bordaLight = white;
  static Color bordaSucesso = stone;

  //Button
  static MaterialStateProperty<Color> botaoPrincipal =
  MaterialStateProperty.all<Color>(
    corPrincipal,
  );
  static MaterialStateProperty<Color> botaoPrincipalOverlay =
  MaterialStateProperty.all<Color>(
    corSegundaria,
  );
  static MaterialStateProperty<Color> botaoLightOverlay =
  MaterialStateProperty.all<Color>(
    corLigth,
  );
  static MaterialStateProperty<Color> botaoLight =
  MaterialStateProperty.all<Color>(
    white,
  );
  static MaterialStateProperty<Color> botaoCancelar =
  MaterialStateProperty.all<Color>(
    red,
  );
  static MaterialStateProperty<Color> botaoVoltar =
  MaterialStateProperty.all<Color>(
    white,
  );
  static MaterialStateProperty<Color> botaoSucesso =
  MaterialStateProperty.all<Color>(
    stone,
  );
  static MaterialStateProperty<Color> botaoSucessoOverlay =
  MaterialStateProperty.all<Color>(
    stoneOverlay,
  );
}
