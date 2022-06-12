import 'package:blank_sample_project/src/common/common.dart';

class Photos extends BaseModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  Photos({this.id, this.title, this.url, this.thumbnailUrl});

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };

  @override
  copyWith({
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) =>
      Photos(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        url,
        thumbnailUrl,
      ];
}
