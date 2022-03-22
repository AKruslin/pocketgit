import 'package:github_app/data/model/owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository_model.g.dart';

@JsonSerializable()
class RepositoryModel {
  String name;
  Owner owner;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'stargazers_count')
  int numberOfStars;
  @JsonKey(name: 'forks_count')
  int numberOfForks;
  @JsonKey(name: 'open_issues_count')
  int numberOfIssues;
  RepositoryModel({
    required this.name,
    required this.owner,
    required this.updatedAt,
    required this.numberOfStars,
    required this.numberOfForks,
    required this.numberOfIssues,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);
}
