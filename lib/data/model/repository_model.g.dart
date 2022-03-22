// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryModel _$RepositoryModelFromJson(Map<String, dynamic> json) =>
    RepositoryModel(
      name: json['name'] as String,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as String,
      numberOfStars: json['stargazers_count'] as int,
      numberOfForks: json['forks_count'] as int,
      numberOfIssues: json['open_issues_count'] as int,
    );

Map<String, dynamic> _$RepositoryModelToJson(RepositoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'updated_at': instance.updatedAt,
      'stargazers_count': instance.numberOfStars,
      'forks_count': instance.numberOfForks,
      'open_issues_count': instance.numberOfIssues,
    };
