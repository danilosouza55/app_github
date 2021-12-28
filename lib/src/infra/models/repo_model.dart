import 'dart:convert';

import 'package:app_github/src/domain/entities/repo.dart';
import 'package:app_github/src/domain/entities/user.dart';

class RepoModel extends Repo {
  final int id;
  final String name;
  final bool private;
  final String htmlUrl;
  final String description;
  final String url;

  RepoModel({
    required this.id,
    required this.name,
    required this.private,
    required this.htmlUrl,
    required this.description,
    required this.url,
  }) : super(
          id: id,
          name: name,
          private: private,
          htmlUrl: htmlUrl,
          description: description,
          url: url,
        );

  static RepoModel fromMap(Map<String, dynamic> json) {
    return RepoModel(
      id: json['id'],
      name: json['name'],
      private: json['private'],
      htmlUrl: json['html_url'],
      description: json['description'] ?? '',
      url: json['url'],
    );
  }

  static RepoModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'RepoModel{id: $id, name: $name, private: $private, htmlUrl: $htmlUrl, description: $description, url: $url}';
  }
}
