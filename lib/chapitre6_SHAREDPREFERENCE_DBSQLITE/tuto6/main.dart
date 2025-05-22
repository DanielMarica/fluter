import 'package:ex4/chapitre6_SHAREDPREFERENCE_DBSQLITE/tuto6/services/post_services.dart';
import 'package:ex4/chapitre6_SHAREDPREFERENCE_DBSQLITE/tuto6/view_model/post_view_model.dart';
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
  runApp(MyApp(postService: databaseProvider));
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
  final PostService postService;

  const MyApp({super.key, required this.postService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostViewModel>(
          create: (context) => PostViewModel(postService),
        ),
        ChangeNotifierProvider<ThemeViewModel>(
          create: (context) => ThemeViewModel(),
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