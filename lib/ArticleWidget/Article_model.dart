class Article {
	String? author;
	String? title;
	String? publishedAt;
	String? urlToImage;
	String? url;
	String? description;
	String? content;

	Article({this.author, this.title, this.publishedAt, this.urlToImage, this.url, this.description, this.content});

	Article.fromJson(Map<String, dynamic> json) {
		author = json['author'];
		title = json['title'];
		publishedAt = json['publishedAt'];
		urlToImage = json['urlToImage'];
		url = json['url'];
		description = json['description'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['author'] = this.author;
		data['title'] = this.title;
		data['publishedAt'] = this.publishedAt;
		data['urlToImage'] = this.urlToImage;
		data['url'] = this.url;
		data['description'] = this.description;
		data['content'] = this.content;
		return data;
	}
}