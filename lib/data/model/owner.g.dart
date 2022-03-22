// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      userName: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      type: json['type'] as String? ?? 'n/a',
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'login': instance.userName,
      'avatar_url': instance.avatarUrl,
      'type': instance.type,
    };
