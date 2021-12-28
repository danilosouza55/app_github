import 'package:app_github/src/core/constants/colors_constants.dart';
import 'package:app_github/src/domain/entities/repo.dart';
import 'package:app_github/src/domain/usecases/search.dart';
import 'package:app_github/src/presenter/theme/page_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RepoPage extends StatelessWidget {
  bool carregando = true;
  final _scrollController = ScrollController();

  RepoPage({Key? key}) : super(key: key);

  init(Search search) async {
    if (carregando) {
      await search.getRepos();

      carregando = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<Search>(context);
    final repos = search.repos;

    init(search);

    return PageTheme(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView.separated(
          itemCount: repos.length,
          controller: _scrollController,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 3,
            endIndent: 10,
            height: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return _buildList(
              context,
              repos[index],
              index,
            );
          },
        ),
      ),
    );
  }

  ListTile _buildList(
    BuildContext context,
    Repo repo,
    int index,
  ) {
    return ListTile(
      onTap: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      hoverColor: ColorsConstants.bordastoneLigth,
      contentPadding: const EdgeInsets.only(
        left: 15,
        top: 5,
        bottom: 5,
        right: 15,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            repo.name,
            style: TextStyle(
              fontSize: 16,
              color: ColorsConstants.textBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            repo.private ? 'Privado' : 'Público',
            style: TextStyle(
              fontSize: 13,
              color: ColorsConstants.textApagado,
            ),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Código: ' + repo.id.toString(),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
