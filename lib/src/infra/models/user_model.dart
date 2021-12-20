import 'dart:convert';

import 'package:app_github/src/domain/entities/user.dart';

class UserModel extends User {
  final int id;
  final String login;
  final String avatarUrl;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;

  final String name;
  final String company;
  final String location;
  final String email;
  final String bio;

  final int publicRepos;
  final int followers;
  final int following;
  final int totalPrivateRepos;

  UserModel({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.name,
    required this.company,
    required this.location,
    required this.email,
    required this.bio,
    required this.publicRepos,
    required this.followers,
    required this.following,
    required this.totalPrivateRepos,
  }) : super(
          id: id,
          login: login,
          avatarUrl: avatarUrl,
          htmlUrl: htmlUrl,
          followersUrl: followersUrl,
          followingUrl: followingUrl,
          gistsUrl: gistsUrl,
          subscriptionsUrl: subscriptionsUrl,
          organizationsUrl: organizationsUrl,
          reposUrl: reposUrl,
          eventsUrl: eventsUrl,
          receivedEventsUrl: receivedEventsUrl,
          name: name,
          company: company,
          location: location,
          email: email,
          bio: bio,
          publicRepos: publicRepos,
          followers: followers,
          following: following,
          totalPrivateRepos: totalPrivateRepos,
        );

  static UserModel fromMap(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        login: json['login'],
        avatarUrl: json['avatar_url'],
        htmlUrl: json['html_url'],
        followersUrl: json['followers_url'],
        followingUrl: json['following_url'],
        gistsUrl: json['gists_url'],
        subscriptionsUrl: json['subscriptions_url'],
        organizationsUrl: json['organizations_url'],
        reposUrl: json['repos_url'],
        eventsUrl: json['events_url'],
        receivedEventsUrl: json['received_events_url'],
        name: json['name'],
        company: json['company'],
        location: json['location'],
        email: json['email'],
        bio: json['bio'],
        publicRepos: json['public_repos'],
        followers: json['followers'],
        following: json['following'],
        totalPrivateRepos: json['total_private_repos']);
  }

  static UserModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel{id: $id, login: $login, avatarUrl: $avatarUrl, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, name: $name, company: $company, location: $location, email: $email, bio: $bio, publicRepos: $publicRepos, followers: $followers, following: $following, totalPrivateRepos: $totalPrivateRepos}';
  }
}
