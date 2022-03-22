// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryDetails _$RepositoryDetailsFromJson(Map<String, dynamic> json) =>
    RepositoryDetails(
      name: json['name'] as String,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      pushedAt: json['pushed_at'] as String,
      numberOfStars: json['stargazers_count'] as int,
      numberOfForks: json['forks_count'] as int,
      numberOfIssues: json['open_issues_count'] as int,
      browserUrl: json['html_url'] as String,
      language: json['language'] as String? ?? 'n/a',
      watchers: json['watchers'] as int,
      defaultBranch: json['default_branch'] as String,
      numberOfsubscribers: json['subscribers_count'] as int,
      networkCount: json['network_count'] as int,
    );

Map<String, dynamic> _$RepositoryDetailsToJson(RepositoryDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'pushed_at': instance.pushedAt,
      'stargazers_count': instance.numberOfStars,
      'forks_count': instance.numberOfForks,
      'open_issues_count': instance.numberOfIssues,
      'default_branch': instance.defaultBranch,
      'subscribers_count': instance.numberOfsubscribers,
      'network_count': instance.networkCount,
      'html_url': instance.browserUrl,
      'language': instance.language,
      'watchers': instance.watchers,
    };
