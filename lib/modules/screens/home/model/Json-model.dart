import 'package:get/get.dart';

class JsonModel {
  int? id;
  var author;
  var quote;
  var category;
  var like;

  JsonModel({
    required this.author,
    required this.category,
    required this.like,
    required this.quote,
    this.id,
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

class ChangeView {
  RxBool show;

  ChangeView({required this.show});
}
