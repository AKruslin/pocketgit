import 'package:flutter/material.dart';
import 'package:github_app/data/model/user_details.dart';
import 'package:github_app/presentation/widgets/open_in_web.dart';
import 'package:github_app/presentation/widgets/user_image.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({
    Key? key,
    required this.userDetails,
  }) : super(key: key);

  final UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          UserImage(
            imageUrl: userDetails.avatarUrl,
            name: userDetails.userName,
            isActive: false,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${userDetails.realName}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Text(
                  'Type: ${userDetails.type}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          OpenInWebButton(url: userDetails.browserUrl),
        ],
      ),
    );
  }
}
