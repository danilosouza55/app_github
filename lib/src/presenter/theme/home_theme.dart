import 'package:app_github/src/domain/usecases/search.dart';
import 'package:app_github/src/presenter/widget/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTheme extends StatelessWidget {
  final Widget child;

  const HomeTheme({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<Search>(context);

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('GitHub Meta'),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              search.clean();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: child,
    );
  }
}
