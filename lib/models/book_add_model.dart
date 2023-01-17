class BookAddModel {
  String? title;
  String? subtitle;
  String? author;
  String? description;
  String? isbn;
  String? publisher;
  String? publised;
  num? pages;
  String? website;

  BookAddModel({
    this.title,
    this.subtitle,
    this.author,
    this.description,
    this.isbn,
    this.publisher,
    this.publised,
    this.pages,
    this.website,
  });

  factory BookAddModel.fromJson(Map<String, dynamic> json) => BookAddModel(
        title: json["title"],
        isbn: json["isbn"],
        subtitle: json["subtitle"],
        author: json["author"],
        publised: json["publised"],
        publisher: json["publisher"],
        pages: json["pages"],
        description: json["description"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "isbn": isbn,
        "subtitle": subtitle,
        "author": author,
        "publised": publised,
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website,
      };
}
