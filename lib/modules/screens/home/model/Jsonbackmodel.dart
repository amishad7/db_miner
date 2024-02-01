class JsonModel {
  int id;
  var author;
  var quote;
  var category;
  var like;

  JsonModel({
    required this.id,
    required this.author,
    required this.category,
    required this.like,
    required this.quote,
  });

  factory JsonModel.fetchData({required Map data}) {
    return JsonModel(
      id: data['id'],
      author: data['author'],
      category: data['category'],
      like: data['like'],
      quote: data['quote'],
    );
  }
}
