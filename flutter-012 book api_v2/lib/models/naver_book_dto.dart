class NaverBookDto {
  String? title; //
  String? link; //
  String? image; //
  String? author; //
  String? discount; //
  String? publisher; //
  String? isbn; //
  String? description; //
  String? pubdate; //

  NaverBookDto({
    this.title,
    this.link,
    this.image,
    this.author,
    this.discount,
    this.publisher,
    this.isbn,
    this.description,
    this.pubdate,
  });

  /// jsonToDto(jsonToMap) json을 dto
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["link"] = link;
    data["image"] = image;
    data["author"] = author;
    data["discount"] = discount;
    data["publisher"] = publisher;
    data["isbn"] = isbn;
    data["description"] = description;
    data["pubdate"] = pubdate;
    return data;
  }

  /// DtoToJson(FromMap) dto를 json

  NaverBookDto.fromson(Map<String, dynamic> json) {
    title = json["title"];
    link = json["link"];
    image = json["image"];
    author = json["author"];
    discount = json["discount"];
    publisher = json["publisher"];
    isbn = json["isbn"];
    description = json["description"];
    pubdate = json["pubdate"];
  }
  @override
  String toString() {
    var result = """
    $title,
    $link,
    $image,
    $author,
    $discount,
    $publisher,
    $isbn,
    $description,
    $pubdate, """;
    return result;
  }
}
