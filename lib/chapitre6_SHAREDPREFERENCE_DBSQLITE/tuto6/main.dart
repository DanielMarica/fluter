import 'package:ex4/chapitre6_SHAREDPREFERENCE_DBSQLITE/tuto6/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import './views/new_post.dart';
import './views/post_list.dart';
import './views/settings.dart';

final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => PostList(),
          routes: [
            GoRoute(
              path: 'new_post',
              builder: (context, state) => NewPost(),
            ),
            GoRoute(
              path: 'settings',
              builder: (context, state) => Settings(),
            )
          ]
      )
    ]
);

void main() => runApp(ChangeNotifierProvider<ThemeViewModel>(
  create: (context) => ThemeViewModel(),
  child: const MyApp(),
  )
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}