// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      userName: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      type: json['type'] as String? ?? 'n/a',
      realName: json['name'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      bio: json['bio'] as String? ?? 'n/a',
      blog: json['blog'] as String? ?? 'n/a',
      location: json['location'] as String? ?? 'n/a',
      publicRepos: json['public_repos'] as int,
      browserUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'login': instance.userName,
      'avatar_url': instance.avatarUrl,
      'type': instance.type,
      'name': instance.realName,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'bio': instance.bio,
      'blog': instance.blog,
      'location': instance.location,
      'public_repos': instance.publicRepos,
      'html_url': instance.browserUrl,
    };
