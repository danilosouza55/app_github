import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  final Logger logger;

  const AppProvider({
    Key? key,
    required this.child,
    required this.logger,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Logger>(
          create: (_) => logger,
        ),
      ],
      child: child,
    );
  }
}
