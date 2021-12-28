import 'package:app_github/src/core/constants/colors_constants.dart';
import 'package:app_github/src/domain/usecases/search.dart';
import 'package:app_github/src/presenter/theme/home_theme.dart';
import 'package:app_github/src/presenter/widget/botao_widget.dart';
import 'package:app_github/src/presenter/widget/show_help.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loadCadastro = false;

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<Search>(context);
    final user = search.user;

    if (user != null) {
      return HomeTheme(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100,
                    child: ClipOval(
                      child: Image.network(
                        user.avatarUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        user.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        user.bio,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person_add_alt,
                          ),
                          Text(
                            ' ${user.followers} followers',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' ${user.following} following',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        user.company,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        user.email,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        user.login,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: SizedBox(
                          width: 250,
                          height: 60,
                          child: ElevatedButton.icon(
                            onPressed: _loadCadastro
                                ? null
                                : () {
                                    _carregarDados(search);
                                  },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: ColorsConstants.stone,
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
                                : const Icon(Icons.pageview_outlined),
                            label: const Text('Repositórios'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const HomeTheme(
        child: Center(
          child: Text(
            'Sem dados',
          ),
        ),
      );
    }
  }

  _carregarDados(Search search) async {
    try {
      setState(() {
        _loadCadastro = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      await search.getRepos();

      Navigator.pushNamed(context, '/repos');
    } catch (e) {
      showHelp(
        context,
        title: 'Atenção!',
        subTitle: 'Erro ao buscar os dados!',
      );
    } finally {
      setState(() {
        _loadCadastro = false;
      });
    }
  }
}
