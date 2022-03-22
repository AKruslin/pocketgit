import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  @JsonKey(name: 'login')
  String userName;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(defaultValue: 'n/a')
  String type;
  @JsonKey(name: 'name')
  String realName;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(defaultValue: 'n/a')
  String bio;
  @JsonKey(defaultValue: 'n/a')
  String blog;
  @JsonKey(defaultValue: 'n/a')
  String location;
  @JsonKey(name: 'public_repos')
  int publicRepos;
  @JsonKey(name: 'html_url')
  String browserUrl;

  UserDetails({
    required this.userName,
    required this.avatarUrl,
    required this.type,
    required this.realName,
    required this.createdAt,
    required this.updatedAt,
    required this.bio,
    required this.blog,
    required this.location,
    required this.publicRepos,
    required this.browserUrl,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'bio': bio,
      'blog': blog,
      'location': location,
      'publicRepos': publicRepos,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  List<String> getListOfKeys() {
    return ['bio', 'blog', 'location', 'publicRepos', 'createdAt', 'updatedAt'];
  }
}
