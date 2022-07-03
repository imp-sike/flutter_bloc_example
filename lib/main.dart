import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/router/app_router.dart';

void main() => runApp(const BaseApp());

class BaseApp extends StatefulWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _appRouter.onGeneratedRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.destroy();
    super.dispose();
  }
}
