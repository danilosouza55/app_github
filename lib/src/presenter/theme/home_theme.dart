import 'package:app_github/src/presenter/widget/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeTheme extends StatelessWidget {
  final Widget child;

  const HomeTheme({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('GitHub Meta'),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: child,
    );
  }
}
