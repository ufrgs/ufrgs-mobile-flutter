class ApiLinks {
  ApiLinks({
    this.self,
  });

  final ApiSelf self;

  factory ApiLinks.fromJson(Map<String, dynamic> json) => ApiLinks(
        self: ApiSelf.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
      };
}

class ApiMeta {
  ApiMeta({
    this.totalCount,
    this.pageCount,
    this.currentPage,
    this.perPage,
  });

  final int totalCount;
  final int pageCount;
  final int currentPage;
  final int perPage;

  factory ApiMeta.fromJson(Map<String, dynamic> json) => ApiMeta(
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        currentPage: json["currentPage"],
        perPage: json["perPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "pageCount": pageCount,
        "currentPage": currentPage,
        "perPage": perPage,
      };
}

class ApiSelf {
  ApiSelf({
    this.href,
  });

  final String href;

  factory ApiSelf.fromJson(Map<String, dynamic> json) => ApiSelf(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}
