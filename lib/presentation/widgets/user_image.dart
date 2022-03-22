import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/common/app_colors.dart';
import 'package:github_app/presentation/cubit/user_cubit.dart';
import 'package:github_app/presentation/pages/user_details.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.isActive = true,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isActive) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => UserCubit(),
                        child: UserDetailsPage(owner: name),
                      )));
        }
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
