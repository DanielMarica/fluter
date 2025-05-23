import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../exo6/service/article_service.dart';
import '../exo6/view/article_row.dart';
import '../exo6/view/form.dart';
import '../exo6/view_model/article_view_model.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ArticleRow(),
      routes: [
        GoRoute(
          path: 'create-article',
          builder: (context, state) => const FormScreen(),
        ),
      ],
    ),
  ],
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseProvider = ArticleService();
  databaseProvider.initDatabase().then((_) {
    runApp(MyApp(articleService: databaseProvider));
  });
}

class MyApp extends StatelessWidget {
  final ArticleService articleService;
  const MyApp({super.key, required this.articleService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ArticleViewModel>(
          create: (context) => ArticleViewModel(articleService),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        routerConfig: _router,
      ),
    );
  }
}