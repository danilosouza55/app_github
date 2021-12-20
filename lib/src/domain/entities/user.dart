class User {
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

  User({
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
  });
}
