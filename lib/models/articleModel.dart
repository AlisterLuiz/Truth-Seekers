class Articles {
  
  dynamic author;
  dynamic content;
  dynamic description;
  dynamic publishedAt;
  // dynamic sourceID;
  // dynamic sourceName;
  dynamic source;
  dynamic title;
  dynamic url;
  dynamic articleImage;

  Articles(
      {this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.source,
      // this.sourceID,
      // this.sourceName,
      this.title,
      this.url,
      this.articleImage});

  factory Articles.fromJson(Map<dynamic, dynamic> json) {
    // print(json['author']);
    return Articles(
      // key: json['']
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      // sourceID: json['source']['id'] ?? '',
      // sourceName: json['source']['name'] ?? '',
      source: json['source'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      articleImage: json['urlToImage'] ?? '',
    );
  }
}
