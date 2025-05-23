import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/article.dart';
import '../service/article_service.dart';

class ArticleViewModel with ChangeNotifier {
  final ArticleService service;
  List<Article> _articles;

  ArticleViewModel(this.service) : _articles = []{
      refreshList();
  }

  UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);

  double get totalPrice => _articles.fold(0.0,(acc,article)=> acc+article.nbrArticle * article.prix);
  double get totalNbrArticle => _articles.fold(0.0,(acc,article)=> acc+article.nbrArticle);

  Future<void> refreshList() async {
    final articles = await service.getArticles();
    _articles = articles;
    notifyListeners();
  }

  Future<void> increaseArticle(String name) async {
    await service.increaseArticleCount(name);
    await refreshList();
  }
  Future<void> decreaseArticle(String name) async {
    final articles = await service.getArticles();
    final article = articles.firstWhere((article) => article.name == name);
    if (article.nbrArticle <= 0) return;
    await service.decreaseArticleCount(name);
    await refreshList();
  }
  Future<void> deleteArticle(String name) async {
    await service.deleteArticle(name);
    await refreshList();
  }
  Future<void> createArticle(String name, double prix, int nbrArticle) async {
    await service.createArticle(name, prix, nbrArticle);
    await refreshList();
  }



}