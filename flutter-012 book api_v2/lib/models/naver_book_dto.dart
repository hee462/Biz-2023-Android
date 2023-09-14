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
// 생성자-> 중괄호로 묶은 이유?
// 각각 이름을 가지고 오기 위해서
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

  /// DtoToMap(jsonToMap) json을 dto
  /// 데이터를 CU(create : insert , Update:Update)를 해야 하는 경우
  /// 주로 NoSQL DB에 저장할때 Dto 데이터를 Map 형식으로 변환한다.
  /// Map 형식으로 변환된 데이터는 JSON type으로 쉽게 변환이 가능하다
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
  /// openAPI 를 통하여 받은 JSON 데이터를 dto 개체로 변환시키는 method
  ///

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
  //선택사항 , 데이터 확인하기 위해서 만들어놈
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
