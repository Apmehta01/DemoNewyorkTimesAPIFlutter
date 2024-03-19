class BooksData {
  String? status;
  String? copyright;
  int? numResults;
  String? lastModified;
  Results? results;

  BooksData(
      {this.status,
        this.copyright,
        this.numResults,
        this.lastModified,
        this.results});

  BooksData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    numResults = json['num_results'];
    lastModified = json['last_modified'];
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['copyright'] = copyright;
    data['num_results'] = numResults;
    data['last_modified'] = lastModified;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  String? listName;
  String? listNameEncoded;
  String? bestsellersDate;
  String? publishedDate;
  String? publishedDateDescription;
  String? nextPublishedDate;
  String? previousPublishedDate;
  String? displayName;
  int? normalListEndsAt;
  String? updated;
  List<Books>? books;

  Results(
      {this.listName,
        this.listNameEncoded,
        this.bestsellersDate,
        this.publishedDate,
        this.publishedDateDescription,
        this.nextPublishedDate,
        this.previousPublishedDate,
        this.displayName,
        this.normalListEndsAt,
        this.updated,
        this.books,
        });

  Results.fromJson(Map<String, dynamic> json) {
    listName = json['list_name'];
    listNameEncoded = json['list_name_encoded'];
    bestsellersDate = json['bestsellers_date'];
    publishedDate = json['published_date'];
    publishedDateDescription = json['published_date_description'];
    nextPublishedDate = json['next_published_date'];
    previousPublishedDate = json['previous_published_date'];
    displayName = json['display_name'];
    normalListEndsAt = json['normal_list_ends_at'];
    updated = json['updated'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list_name'] = listName;
    data['list_name_encoded'] = listNameEncoded;
    data['bestsellers_date'] = bestsellersDate;
    data['published_date'] = publishedDate;
    data['published_date_description'] = publishedDateDescription;
    data['next_published_date'] = nextPublishedDate;
    data['previous_published_date'] = previousPublishedDate;
    data['display_name'] = displayName;
    data['normal_list_ends_at'] = normalListEndsAt;
    data['updated'] = updated;
    if (books != null) {
      data['books'] = books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? rank;
  int? rankLastWeek;
  int? weeksOnList;
  int? asterisk;
  int? dagger;
  String? primaryIsbn10;
  String? primaryIsbn13;
  String? publisher;
  String? description;
  String? price;
  String? title;
  String? author;
  String? contributor;
  String? contributorNote;
  String? bookImage;
  int? bookImageWidth;
  int? bookImageHeight;
  String? amazonProductUrl;
  String? ageGroup;
  String? bookReviewLink;
  String? firstChapterLink;
  String? sundayReviewLink;
  String? articleChapterLink;
  List<Isbns>? isbns;
  List<BuyLinks>? buyLinks;
  String? bookUri;

  Books(
      {this.rank,
        this.rankLastWeek,
        this.weeksOnList,
        this.asterisk,
        this.dagger,
        this.primaryIsbn10,
        this.primaryIsbn13,
        this.publisher,
        this.description,
        this.price,
        this.title,
        this.author,
        this.contributor,
        this.contributorNote,
        this.bookImage,
        this.bookImageWidth,
        this.bookImageHeight,
        this.amazonProductUrl,
        this.ageGroup,
        this.bookReviewLink,
        this.firstChapterLink,
        this.sundayReviewLink,
        this.articleChapterLink,
        this.isbns,
        this.buyLinks,
        this.bookUri});

  Books.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    rankLastWeek = json['rank_last_week'];
    weeksOnList = json['weeks_on_list'];
    asterisk = json['asterisk'];
    dagger = json['dagger'];
    primaryIsbn10 = json['primary_isbn10'];
    primaryIsbn13 = json['primary_isbn13'];
    publisher = json['publisher'];
    description = json['description'];
    price = json['price'];
    title = json['title'];
    author = json['author'];
    contributor = json['contributor'];
    contributorNote = json['contributor_note'];
    bookImage = json['book_image'];
    bookImageWidth = json['book_image_width'];
    bookImageHeight = json['book_image_height'];
    amazonProductUrl = json['amazon_product_url'];
    ageGroup = json['age_group'];
    bookReviewLink = json['book_review_link'];
    firstChapterLink = json['first_chapter_link'];
    sundayReviewLink = json['sunday_review_link'];
    articleChapterLink = json['article_chapter_link'];
    if (json['isbns'] != null) {
      isbns = <Isbns>[];
      json['isbns'].forEach((v) {
        isbns!.add(Isbns.fromJson(v));
      });
    }
    if (json['buy_links'] != null) {
      buyLinks = <BuyLinks>[];
      json['buy_links'].forEach((v) {
        buyLinks!.add(BuyLinks.fromJson(v));
      });
    }
    bookUri = json['book_uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rank'] = rank;
    data['rank_last_week'] = rankLastWeek;
    data['weeks_on_list'] = weeksOnList;
    data['asterisk'] = asterisk;
    data['dagger'] = dagger;
    data['primary_isbn10'] = primaryIsbn10;
    data['primary_isbn13'] = primaryIsbn13;
    data['publisher'] = publisher;
    data['description'] = description;
    data['price'] = price;
    data['title'] = title;
    data['author'] = author;
    data['contributor'] = contributor;
    data['contributor_note'] = contributorNote;
    data['book_image'] = bookImage;
    data['book_image_width'] = bookImageWidth;
    data['book_image_height'] = bookImageHeight;
    data['amazon_product_url'] = amazonProductUrl;
    data['age_group'] = ageGroup;
    data['book_review_link'] = bookReviewLink;
    data['first_chapter_link'] = firstChapterLink;
    data['sunday_review_link'] = sundayReviewLink;
    data['article_chapter_link'] = articleChapterLink;
    if (isbns != null) {
      data['isbns'] = isbns!.map((v) => v.toJson()).toList();
    }
    if (buyLinks != null) {
      data['buy_links'] = buyLinks!.map((v) => v.toJson()).toList();
    }
    data['book_uri'] = bookUri;
    return data;
  }
}

class Isbns {
  String? isbn10;
  String? isbn13;

  Isbns({this.isbn10, this.isbn13});

  Isbns.fromJson(Map<String, dynamic> json) {
    isbn10 = json['isbn10'];
    isbn13 = json['isbn13'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isbn10'] = isbn10;
    data['isbn13'] = isbn13;
    return data;
  }
}

class BuyLinks {
  String? name;
  String? url;

  BuyLinks({this.name, this.url});

  BuyLinks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
