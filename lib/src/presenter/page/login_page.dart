import 'package:app_github/src/core/constants/colors_constants.dart';
import 'package:app_github/src/domain/usecases/search.dart';
import 'package:app_github/src/presenter/widget/form/input_text.dart';
import 'package:app_github/src/presenter/widget/show_help.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController keyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _loadCadastro = false;
  bool carregarTela = true;

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<Search>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'App GitHub Meta',
                  style: TextStyle(
                    color: ColorsConstants.textLight,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                InputText(
                  titulo: 'Informe a chave de conexão do GitHub Teste',
                  isNull: false,
                  controller: keyController,
                  icon: Icons.password,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: _loadCadastro
                          ? null
                          : () {
                              _carregarDados(search);
                            },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.green,
                      ),
                      icon: _loadCadastro
                          ? Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(2.0),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : const Icon(Icons.send),
                      label: const Text('Iniciar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _carregarDados(Search search) async {
    if (_formKey.currentState!.validate()) {
      carregarTela = false;

      try {
        setState(() {
          _loadCadastro = true;
        });

        await search.getUser(keyController.text);

        if (!search.active) {
          showHelp(
            context,
            title: 'Atenção!',
            subTitle: 'Key incorreta!',
          );
        } else {
          Navigator.pushReplacementNamed(context, '/');
        }
      } catch (e) {
        showHelp(
          context,
          title: 'Atenção!',
          subTitle: 'Erro ao efetuar a busca dos dados!',
        );
      } finally {
        setState(() {
          _loadCadastro = false;
        });
      }
    }
  }
}
