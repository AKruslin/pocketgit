import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable()
class Owner {
  @JsonKey(name: 'login')
  String userName;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(defaultValue: 'n/a')
  String type;
  Owner({
    required this.userName,
    required this.avatarUrl,
    required this.type,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
