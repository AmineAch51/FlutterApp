class Quote {
  Quote({ required this.text, required this.author });

  Quote.fromJson(Map<String, dynamic> json) {
    text = json["text"] ?? "None";
    author = json["author"] ?? "None";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = <String, dynamic>{};
    result["text"] = text;
    result["author"] = author;
    return result;
  }


  @override
  String toString() {
    return 'Quote{text: $text, author: $author}';
  }

  String text="";
  String author="";
}