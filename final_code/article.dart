import 'dart:convert';

class NewsArticle {
  final String author;
  final String content;
  final String date;
  final String id;
  final String imageUrl;
  final String readMoreUrl;
  final String time;
  final String title;
  final String url;
  NewsArticle({
    required this.author,
    required this.content,
    required this.date,
    required this.id,
    required this.imageUrl,
    required this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  NewsArticle copyWith({
    String? author,
    String? content,
    String? date,
    String? id,
    String? imageUrl,
    String? readMoreUrl,
    String? time,
    String? title,
    String? url,
  }) {
    return NewsArticle(
      author: author ?? this.author,
      content: content ?? this.content,
      date: date ?? this.date,
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      readMoreUrl: readMoreUrl ?? this.readMoreUrl,
      time: time ?? this.time,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'content': content,
      'date': date,
      'id': id,
      'imageUrl': imageUrl,
      'readMoreUrl': readMoreUrl,
      'time': time,
      'title': title,
      'url': url,
    };
  }

  factory NewsArticle.fromMap(Map<String, dynamic> map) {
    return NewsArticle(
      author: map['author'] ?? '',
      content: map['content'] ?? '',
      date: map['date'] ?? '',
      id: map['id'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      readMoreUrl: map['readMoreUrl'] ?? '',
      time: map['time'] ?? '',
      title: map['title'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsArticle.fromJson(String source) =>
      NewsArticle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsArticle(author: $author, content: $content, date: $date, id: $id, imageUrl: $imageUrl, readMoreUrl: $readMoreUrl, time: $time, title: $title, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsArticle &&
        other.author == author &&
        other.content == content &&
        other.date == date &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.readMoreUrl == readMoreUrl &&
        other.time == time &&
        other.title == title &&
        other.url == url;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        content.hashCode ^
        date.hashCode ^
        id.hashCode ^
        imageUrl.hashCode ^
        readMoreUrl.hashCode ^
        time.hashCode ^
        title.hashCode ^
        url.hashCode;
  }
}
