import 'package:app_github/src/core/constants/colors_constants.dart';
import 'package:app_github/src/domain/usecases/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../botao_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<Search>(context);
    final user = search.user;

    return Drawer(
      elevation: 10,
      child: Container(
        color: ColorsConstants.purpleLinx,
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 100,
                child: ClipOval(
                  child: Image.network(
                    user!.avatarUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              user.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColorsConstants.white,
              ),
            ),
            Text(
              user.bio,
              style: TextStyle(
                fontSize: 20,
                color: ColorsConstants.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: BotaoWidget(
                padding: const EdgeInsets.only(top: 5.0),
                funcao: () {
                  onSair(context, search);
                },
                corFundo: ColorsConstants.botaoPrincipal,
                corBorda: ColorsConstants.bordaPrincipalLight,
                titulo: 'Sair do login',
                corTexto: ColorsConstants.textLight,
                overlay: ColorsConstants.botaoPrincipalOverlay,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSair(BuildContext context, Search search) {
    search.clean();

    Navigator.pushReplacementNamed(context, '/login');
  }
}
