import 'package:app_github/src/presenter/widget/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class PageTheme extends StatelessWidget {
  final Widget child;

  const PageTheme({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repos'),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: child,
    );
  }
}
