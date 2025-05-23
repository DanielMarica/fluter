import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import '../models/article.dart';

class ArticleService {
  late Database _database;

  Database get database => _database;

  Future<Article> createArticle(String name, double prix, int nbrArticle) async {
    final id = await _database.insert('Article', {
      "name": name,
      "prix": prix,
      "nbrArticle": nbrArticle,
    });
    final post = Article(id: id, name: name, prix: prix, nbrArticle: nbrArticle );
    return post;
  }

  Future<void> deleteArticle(String name) async {
    await _database.delete('Article', where: 'name = ?', whereArgs: [name]);
  }

  Future<void> increaseArticleCount(String name) async {
    final result = await _database.query("Article" , where: "name = ? ",whereArgs: [name],);
    final int count = result[0]["nbrArticle"] as int;
    await _database.update('Article', {'nbrArticle': count + 1}, where: 'name = ?', whereArgs: [name]);
  }

  Future<void> decreaseArticleCount(String name) async {
    final result = await _database.query("Article" , where: "name = ? ",whereArgs: [name],);
    if (result.isNotEmpty){
      final int count = result[0]["nbrArticle"] as int;
      if (count <= 0) return;
      await _database.update('Article', {'nbrArticle': count - 1}, where: 'name = ?', whereArgs: [name]);
    }
  }

  Future<List<Article>> getArticles() async {
    final maps = await _database.query('Article');
    return List.generate(maps.length, (i) {
      return Article(
        id: maps[i]['id'] as int?,
        name: maps[i]['name'] as String,
        prix: maps[i]['prix'] as double,
        nbrArticle: maps[i]['nbrArticle'] as int,
      );
    });
  }

  Future<void> initDatabase() async {
    if (kIsWeb) {
      WidgetsFlutterBinding.ensureInitialized();
      databaseFactory = databaseFactoryFfiWeb;
    }

    _database = await openDatabase(
      join(await getDatabasesPath(), 'test.db'),
      version: 1,
    );

    final result = await _database.rawQuery(
      "SELECT count(*) AS count FROM sqlite_master WHERE type='table' AND name='Article'",
    );

    if (result[0]["count"] == 0) {
      await _database.execute(
        'CREATE TABLE Article(id INTEGER PRIMARY KEY, name TEXT, prix DOUBLE, nbrArticle INTEGER)',
      );
      await _database.insert('Article', <String, Object?>{
        'id': 1,
        'name' : 'fromage itlalien',
        'prix': 10.0,
        'nbrArticle': 1,
      });
      await _database.insert('Article', <String, Object?>{
        'id': 2,
        'name' : 'chou fleur',
        'prix': 20.0,
        'nbrArticle': 2,
      });
    }
  }
}