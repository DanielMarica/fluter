import 'package:ex4/chapitre6_SHAREDPREFERENCE_DBSQLITE/tuto6/services/post_services.dart';
import 'package:ex4/chapitre6_SHAREDPREFERENCE_DBSQLITE/tuto6/view_model/theme_view_model.dart';
import 'package:ex4/chapitre6_SHAREDPREFERENCE_DBSQLITE/tuto6/views/new_post.dart';
import 'package:ex4/chapitre6_SHAREDPREFERENCE_DBSQLITE/tuto6/views/post_list.dart';
import 'package:ex4/chapitre6_SHAREDPREFERENCE_DBSQLITE/tuto6/views/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseProvider = PostService();
  await databaseProvider.initDatabase();
  print(await databaseProvider.getPosts());
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PostList(),
      routes: [
        GoRoute(
          path: 'new_post',
          builder: (context, state) => const NewPost(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const Settings(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeViewModel>(
      create: (context) => ThemeViewModel(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}