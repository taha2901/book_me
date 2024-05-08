
class BooksModel {
    int? results;
    Pagination? pagination;
    List<DataBooks>? data;

    BooksModel({this.results, this.pagination, this.data});

    BooksModel.fromJson(Map<String, dynamic> json) {
        results = json["results"];
        pagination = json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]);
        data = json["data"] == null ? null : (json["data"] as List).map((e) => DataBooks.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["results"] = results;
        if(pagination != null) {
            _data["pagination"] = pagination?.toJson();
        }
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class DataBooks {
    String? id;
    String? title;
    Author? author;
    String? description;
    int? price;
    String? cover;
    String? pdf;
    int? averageRating;
    int? reviewCount;
    String? createdAt;
    String? updatedAt;

    DataBooks({this.id, this.title, this.author, this.description, this.price, this.cover, this.pdf, this.averageRating, this.reviewCount, this.createdAt, this.updatedAt});

    DataBooks.fromJson(Map<String, dynamic> json) {
        id = json["_id"];
        title = json["title"];
        author = json["author"] == null ? null : Author.fromJson(json["author"]);
        description = json["description"];
        price = json["price"];
        cover = json["cover"];
        pdf = json["pdf"];
        averageRating = json["averageRating"];
        reviewCount = json["reviewCount"];
        createdAt = json["createdAt"];
        updatedAt = json["updatedAt"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["_id"] = id;
        _data["title"] = title;
        if(author != null) {
            _data["author"] = author?.toJson();
        }
        _data["description"] = description;
        _data["price"] = price;
        _data["cover"] = cover;
        _data["pdf"] = pdf;
        _data["averageRating"] = averageRating;
        _data["reviewCount"] = reviewCount;
        _data["createdAt"] = createdAt;
        _data["updatedAt"] = updatedAt;
        return _data;
    }
}

class Author {
    String? id;
    String? firstName;
    String? lastName;
    String? bio;
    String? createdAt;
    String? updatedAt;
    int? v;

    Author({this.id, this.firstName, this.lastName, this.bio, this.createdAt, this.updatedAt, this.v});

    Author.fromJson(Map<String, dynamic> json) {
        id = json["_id"];
        firstName = json["firstName"];
        lastName = json["lastName"];
        bio = json["bio"];
        createdAt = json["createdAt"];
        updatedAt = json["updatedAt"];
        v = json["__v"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["_id"] = id;
        _data["firstName"] = firstName;
        _data["lastName"] = lastName;
        _data["bio"] = bio;
        _data["createdAt"] = createdAt;
        _data["updatedAt"] = updatedAt;
        _data["__v"] = v;
        return _data;
    }
}

class Pagination {
    int? total;
    int? page;
    int? limit;
    int? pages;
    int? next;
    dynamic prev;

    Pagination({this.total, this.page, this.limit, this.pages, this.next, this.prev});

    Pagination.fromJson(Map<String, dynamic> json) {
        total = json["total"];
        page = json["page"];
        limit = json["limit"];
        pages = json["pages"];
        next = json["next"];
        prev = json["prev"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["total"] = total;
        _data["page"] = page;
        _data["limit"] = limit;
        _data["pages"] = pages;
        _data["next"] = next;
        _data["prev"] = prev;
        return _data;
    }
}