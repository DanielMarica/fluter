import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../tuto6/widgets/nav_bar.dart';
import '../view_model/article_view_model.dart';
class ArticleRow extends StatelessWidget {
  const ArticleRow({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'fr_FR', symbol: '€');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Article Home Screen'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {}, // Action panier
                ),
                if (Provider.of<ArticleViewModel>(context).totalNbrArticle > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 8, right: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${Provider.of<ArticleViewModel>(context).totalNbrArticle.toInt()}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/create-article');
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<ArticleViewModel>(
        builder: (context, model, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: model.articles.length,
                  itemBuilder: (context, index) {
                    final article = model.articles[index];
                    return ListTile(
                      title: Text(article.name),
                      subtitle: Text(
                        "Unit Price : ${formatCurrency.format(article.prix)}\n"
                            "Total Price : ${formatCurrency.format(article.prix * article.nbrArticle)}",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => model.decreaseArticle(article.name),
                            icon: const Icon(Icons.remove),
                          ),
                          Text("${article.nbrArticle}"),
                          IconButton(
                            onPressed: () => model.increaseArticle(article.name),
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () => model.deleteArticle(article.name),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total cart price: ${formatCurrency.format(model.totalPrice)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}