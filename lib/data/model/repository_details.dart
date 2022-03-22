import 'package:json_annotation/json_annotation.dart';

import 'package:github_app/data/model/owner.dart';

part 'repository_details.g.dart';

@JsonSerializable()
class RepositoryDetails {
  String name;
  Owner owner;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'pushed_at')
  String pushedAt;
  @JsonKey(name: 'stargazers_count')
  int numberOfStars;
  @JsonKey(name: 'forks_count')
  int numberOfForks;
  @JsonKey(name: 'open_issues_count')
  int numberOfIssues;
  @JsonKey(name: 'default_branch')
  String defaultBranch;
  @JsonKey(name: 'subscribers_count')
  int numberOfsubscribers;
  @JsonKey(name: 'network_count')
  int networkCount;
  @JsonKey(name: 'html_url')
  String browserUrl;
  @JsonKey(defaultValue: 'n/a')
  String language;
  int watchers;

  RepositoryDetails({
    required this.name,
    required this.owner,
    required this.updatedAt,
    required this.createdAt,
    required this.pushedAt,
    required this.numberOfStars,
    required this.numberOfForks,
    required this.numberOfIssues,
    required this.browserUrl,
    required this.language,
    required this.watchers,
    required this.defaultBranch,
    required this.numberOfsubscribers,
    required this.networkCount,
  });

  factory RepositoryDetails.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryDetailsToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'pushedAt': pushedAt,
      'numberOfStars': numberOfStars,
      'numberOfForks': numberOfForks,
      'numberOfIssues': numberOfIssues,
      'defaultBranch': defaultBranch,
      'numberOfsubscribers': numberOfsubscribers,
      'networkCount': networkCount,
      'language': language,
      'watchers': watchers,
    };
  }

  List<String> getListOfKeys() {
    return [
      'name',
      'language',
      'defaultBranch',
      'numberOfStars',
      'numberOfForks',
      'numberOfIssues',
      'numberOfsubscribers',
      'networkCount',
      'watchers',
      'createdAt',
      'updatedAt',
      'pushedAt',
    ];
  }
}
