class Article {
  final int? id;
  final String name;
  final double prix;
  final int nbrArticle;

  Article({this.id,required this.name, required this.prix, required this.nbrArticle});
  Article.create({
    this.id,
    required this.name,
    required this.prix,
    this.nbrArticle = 0,
  });
  @override
  String toString() {
    return 'Article{id: $id, name: $name, prix: $prix, nbrArticle: $nbrArticle}';
  }
}