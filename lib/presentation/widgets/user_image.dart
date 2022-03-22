import 'package:flutter/material.dart';
import 'package:github_app/common/app_colors.dart';
import 'package:github_app/presentation/pages/user_details_page.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserDetailsPage()));
      },
      child: Container(
        padding: const EdgeInsets.all(2.5),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.brandWhite,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            imageUrl,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
