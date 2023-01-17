class BookResponseModel {
  BookResponseModel({
    this.data,
    this.meta,
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  List<BookDataModel>? data;
  BookMetaModel? meta;
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link?>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory BookResponseModel.fromJson(Map<String, dynamic> json) =>
      BookResponseModel(
        data: json["data"] != null
            ? List<BookDataModel>.from(
                json["data"].map((x) => BookDataModel.fromJson(x)))
            : null,
        meta: BookMetaModel.fromJson(json["meta"]),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link?>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() {
    return {
      "data": data != null
          ? List<dynamic>.from(data!.map((x) => x.toJson()))
          : null,
      "meta": meta!.toJson(),
      "first_page_url": firstPageUrl,
      "from": from,
      "last_page": lastPage,
      "last_page_url": lastPageUrl,
      "links": links == null
          ? []
          : List<dynamic>.from(links!.map((x) => x!.toJson())),
      "next_page_url": nextPageUrl,
      "path": path,
      "per_page": perPage,
      "prev_page_url": prevPageUrl,
      "to": to,
      "total": total,
    };
  }
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class BookDataModel {
  BookDataModel({
    this.isbn,
    this.title,
    this.author,
    this.subtitle,
    this.description,
    this.website,
    this.published,
    this.publisher,
    this.pages,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.user_id,
  });

  String? isbn;
  String? title;
  String? subtitle;
  String? author;
  DateTime? published;
  String? publisher;
  String? description;
  String? website;
  int? user_id;
  int? id;
  int? pages;

  DateTime? createdAt;
  DateTime? updatedAt;

  factory BookDataModel.fromJson(Map<String, dynamic> json) => BookDataModel(
        user_id: json["user_id"],
        id: json["id"],
        isbn: json["isbn"],
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        published: json["published"],
        publisher: json["publisher"],
        pages: json["pages"],
        description: json["description"],
        website: json["website"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "isbn": isbn,
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published,
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class BookMetaModel {
  BookMetaModel({
    this.code,
    this.status,
    this.message,
  });

  int? code;
  String? status;
  String? message;

  factory BookMetaModel.fromJson(Map<String, dynamic> json) => BookMetaModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
